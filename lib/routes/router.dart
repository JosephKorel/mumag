import 'package:firebase_auth/firebase_auth.dart' as Firebase;
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mumag/common/services/authentication/domain/auth_entity.dart';
import 'package:mumag/common/services/authentication/providers/auth.dart';
import 'package:mumag/common/services/firebase/providers/auth.dart';
import 'package:mumag/common/services/shared_pref/providers/shared_pref.dart';
import 'package:mumag/common/services/user/providers/user_provider.dart';
import 'package:mumag/routes/routes.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'router.g.dart';

@riverpod
GlobalKey<NavigatorState> globalKey(GlobalKeyRef ref) {
  return GlobalKey<NavigatorState>(debugLabel: 'routerKey');
}

@riverpod
GoRouter router(RouterRef ref) {
  final routerKey = ref.watch(globalKeyProvider);
  final isAuth = ValueNotifier<AuthState>(Loading());

  ref
    ..onDispose(isAuth.dispose)
    ..listen(
      authStreamProvider.select((value) => value.whenData((value) => value)),
      (prev, next) async {
        final state = await _handleAuthState(next, ref);
        ref.read(authStateControllerProvider.notifier).updateState(state);
      },
    )
    ..listen(userProvider, (previous, next) {
      if (next.requireValue != null) {
        final credentials =
            ref.read(credentialsImplementationProvider).retrieveCredentials();

        if (credentials != null) {
          ref
              .read(authStateControllerProvider.notifier)
              .updateState(HasCredentials());
        }
      }
    })
    ..listen(authStateControllerProvider, (prev, next) {
      isAuth.value = next;
    });

  return GoRouter(
    navigatorKey: routerKey,
    initialLocation: const SplashRoute().location,
    routes: $appRoutes,
    refreshListenable: isAuth,
    redirect: (context, state) {
      final shouldRedirectLocations = [
        const SignInRoute().location,
        const ConnectToSpotifyRoute().location,
        const SplashRoute().location,
      ];

      return isAuth.value.when(
        () {
          return null;
        },
        unauthenticated: () => const SignInRoute().location,
        loading: () => const SplashRoute().location,
        authenticated: () {
          return const ConnectToSpotifyRoute().location;
        },
        hasCredentials: () {
          return shouldRedirectLocations.contains(state.fullPath) ||
                  state.fullPath == null
              ? const HomeRoute().location
              : null;
        },
        connectedUser: () => null,
      );
    },
  );
}

Future<AuthState> _handleAuthState(
  AsyncValue<Firebase.User?> next,
  RouterRef ref,
) async {
  if (next.requireValue == null) {
    return Unauthenticated();
  }

  final credentials =
      ref.read(credentialsImplementationProvider).retrieveCredentials();

  if (credentials != null) {
    final user = await ref.read(userExistsProvider.future);

    return user ? HasCredentials() : Authenticated();
  } else {
    return Authenticated();
  }
}
