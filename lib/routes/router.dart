import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
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
GoRouter router(RouterRef ref) {
  final routerKey = GlobalKey<NavigatorState>(debugLabel: 'routerKey');
  final isAuth = ValueNotifier<AuthState>(Loading());

  ref
    ..onDispose(isAuth.dispose)
    ..listen(
      authStreamProvider.select((value) => value.whenData((value) => value)),
      (prev, next) async {
        final state = await handleAuthState(next, ref);
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
      log('Changed from: $prev, next: $next');
      isAuth.value = next;
    });

  return GoRouter(
    navigatorKey: routerKey,
    initialLocation: const SplashRoute().location,
    routes: $appRoutes,
    refreshListenable: isAuth,
    redirect: (context, state) {
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
          return const ProfileRoute().location;
        },
      );
    },
  );
}

Future<void> onAuth(
  AsyncValue<User?>? prev,
  AsyncValue<User?> next,
  RouterRef ref,
) async {
  if (next.requireValue != null) {
    final credentials =
        ref.read(credentialsImplementationProvider).retrieveCredentials();

    if (credentials != null) {
      final user = await ref.read(userProvider.future);
      ref
          .read(authStateControllerProvider.notifier)
          .updateState(user == null ? Authenticated() : HasCredentials());
    } else {
      ref
          .read(authStateControllerProvider.notifier)
          .updateState(Authenticated());
    }
    return;
  }

  ref.read(authStateControllerProvider.notifier).updateState(Unauthenticated());
}

Future<AuthState> handleAuthState(AsyncValue<User?> next, RouterRef ref) async {
  if (next.requireValue == null) {
    return Unauthenticated();
  }

  final credentials =
      ref.read(credentialsImplementationProvider).retrieveCredentials();

  if (credentials != null) {
    final user = await ref.read(userProvider.future);
    return user == null ? Authenticated() : HasCredentials();
  } else {
    return Authenticated();
  }
}
