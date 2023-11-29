import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mumag/common/services/authentication/domain/auth_entity.dart';
import 'package:mumag/common/services/authentication/providers/auth.dart';
import 'package:mumag/common/services/firebase/providers/auth.dart';
import 'package:mumag/common/services/shared_pref/providers/shared_pref.dart';
import 'package:mumag/common/services/spotify/providers/credentials.dart';
import 'package:mumag/routes/routes.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'router.g.dart';

@riverpod
GoRouter router(RouterRef ref) {
  final routerKey = GlobalKey<NavigatorState>(debugLabel: 'routerKey');
  final isAuth = ValueNotifier<AuthState>(Loading());
  // final hasConnected = ref.watch(connectSpotifyProvider);

  // log((isAuth.value.requireValue == AuthEntity.unauthenticated()).toString());

  /*  ref
    ..onDispose(isAuth.dispose)
    ..listen(
      authStreamProvider.select((value) => value.whenData((value) => value)),
      (_, next) {
        isAuth.value = AsyncData(next.requireValue != null);
      },
    )
    ..listen(spotifyUserTokenProvider, (_, next) {
      isConnected.value = next;
    }); */

  ref
    ..onDispose(isAuth.dispose)
    ..listen(
      authStreamProvider.select((value) => value.whenData((value) => value)),
      (prev, next) {
        if (next.requireValue != null) {
          /* ref
              .read(authStateControllerProvider.notifier)
              .updateState(Authenticated()); */

          final credentials =
              ref.read(credentialsImplementationProvider).retrieveCredentials();

          if (credentials != null) {
            ref
                .read(authStateControllerProvider.notifier)
                .updateState(HasCredentials());
          } else {
            ref
                .read(authStateControllerProvider.notifier)
                .updateState(Authenticated());
          }
        }
      },
    )
    ..listen(credentialsControllerProvider, (previous, next) {
      if (next != null) {
        ref
            .read(authStateControllerProvider.notifier)
            .updateState(HasCredentials());
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
      /* if (hasConnected.isLoading || !hasConnected.requireValue) {
        return const SplashRoute().location;
      } */
      /*  if (isAuth.value.unwrapPrevious().hasError) {
        return const SignInRoute().location;
      }

      if (isAuth.value.isLoading || !isAuth.value.hasValue) {
        return const SplashRoute().location;
      } */

      final isSplash = state.uri.path == const SplashRoute().location;
      final isLoggingIn = state.uri.path == const SignInRoute().location;

      return isAuth.value.when(
          () {
            log('É NULL');
            return null;
          },
          unauthenticated: () => const SignInRoute().location,
          loading: () => const SplashRoute().location,
          authenticated: () {
            log('É AUTENTICADO');
            return const HomeRoute().location;
          },
          hasCredentials: () {
            log('É CONNECTADO');

            return const ProfileRoute().location;
          });

      /* switch (isAuth.value) {
        case Loading():
          return const SplashRoute().location;

        case Unauthenticated():
          return const SignInRoute().location;

        case Authenticated():
          return const HomeRoute().location;

        case HasPermissions():
          return const ProfileRoute().location;

        default:
          return null;
      } */

      /*  final auth = isAuth.value.requireValue;

      final isSplash = state.uri.path == const SplashRoute().location;
      if (isSplash) {
        return auth.authenticated
            ? const HomeRoute().location
            : const SignInRoute().location;
      }

      if (isLoggingIn) return auth ? const HomeRoute().location : null;

      final isHome = state.uri.path == const HomeRoute().location;
      if (isHome) {
        log('Vim pra cá');
        return isConnected.value == null ? null : const ProfileRoute().location;
      }

      return auth ? null : const SplashRoute().location; */
    },
  );
}
