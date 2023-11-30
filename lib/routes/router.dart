import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mumag/common/services/authentication/domain/auth_entity.dart';
import 'package:mumag/common/services/authentication/providers/auth.dart';
import 'package:mumag/common/services/firebase/providers/auth.dart';
import 'package:mumag/common/services/shared_pref/providers/shared_pref.dart';
import 'package:mumag/common/services/spotify_auth/providers/credentials.dart';
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
      (prev, next) {
        if (next.requireValue != null) {
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
          return;
        }

        ref
            .read(authStateControllerProvider.notifier)
            .updateState(Unauthenticated());
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
      return isAuth.value.when(
          () {
            return null;
          },
          unauthenticated: () => const SignInRoute().location,
          loading: () => const SplashRoute().location,
          authenticated: () {
            return const HomeRoute().location;
          },
          hasCredentials: () {
            return const ProfileRoute().location;
          });
    },
  );
}
