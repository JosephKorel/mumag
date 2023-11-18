import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mumag/common/services/firebase/providers/auth.dart';
import 'package:mumag/routes/routes.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'router.g.dart';

@riverpod
GoRouter router(RouterRef ref) {
  final routerKey = GlobalKey<NavigatorState>(debugLabel: 'routerKey');
  final isAuth = ValueNotifier<AsyncValue<bool>>(const AsyncLoading());

  ref
    ..onDispose(isAuth.dispose)
    ..listen(
      authStreamProvider.select((value) => value.whenData((value) => value)),
      (_, next) {
        isAuth.value = AsyncData(next.requireValue != null);
      },
    );

  return GoRouter(
    navigatorKey: routerKey,
    initialLocation: const SplashRoute().location,
    routes: $appRoutes,
    refreshListenable: isAuth,
    redirect: (context, state) {
      if (isAuth.value.unwrapPrevious().hasError) {
        return const SignInRoute().location;
      }

      if (isAuth.value.isLoading || !isAuth.value.hasValue) {
        return const SplashRoute().location;
      }

      final auth = isAuth.value.requireValue;

      final isSplash = state.uri.path == const SplashRoute().location;
      if (isSplash) {
        return auth ? const HomeRoute().location : const SignInRoute().location;
      }

      final isLoggingIn = state.uri.path == const SignInRoute().location;
      if (isLoggingIn) return auth ? const HomeRoute().location : null;

      return auth ? null : const SplashRoute().location;
    },
  );
}
