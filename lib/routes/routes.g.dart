// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'routes.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
      $splashRoute,
      $signInRoute,
      $connectToSpotifyRoute,
      $homeRoute,
      $profileRoute,
      $searchRoute,
      $searchUserRoute,
      $viewUserRoute,
      $artistViewRoute,
      $albumViewRoute,
      $trackViewRoute,
    ];

RouteBase get $splashRoute => GoRouteData.$route(
      path: '/splash',
      factory: $SplashRouteExtension._fromState,
    );

extension $SplashRouteExtension on SplashRoute {
  static SplashRoute _fromState(GoRouterState state) => const SplashRoute();

  String get location => GoRouteData.$location(
        '/splash',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $signInRoute => GoRouteData.$route(
      path: '/sign-in',
      factory: $SignInRouteExtension._fromState,
    );

extension $SignInRouteExtension on SignInRoute {
  static SignInRoute _fromState(GoRouterState state) => const SignInRoute();

  String get location => GoRouteData.$location(
        '/sign-in',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $connectToSpotifyRoute => GoRouteData.$route(
      path: '/connect',
      factory: $ConnectToSpotifyRouteExtension._fromState,
    );

extension $ConnectToSpotifyRouteExtension on ConnectToSpotifyRoute {
  static ConnectToSpotifyRoute _fromState(GoRouterState state) =>
      const ConnectToSpotifyRoute();

  String get location => GoRouteData.$location(
        '/connect',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $homeRoute => GoRouteData.$route(
      path: '/home',
      factory: $HomeRouteExtension._fromState,
    );

extension $HomeRouteExtension on HomeRoute {
  static HomeRoute _fromState(GoRouterState state) => const HomeRoute();

  String get location => GoRouteData.$location(
        '/home',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $profileRoute => GoRouteData.$route(
      path: '/profile',
      factory: $ProfileRouteExtension._fromState,
    );

extension $ProfileRouteExtension on ProfileRoute {
  static ProfileRoute _fromState(GoRouterState state) => const ProfileRoute();

  String get location => GoRouteData.$location(
        '/profile',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $searchRoute => GoRouteData.$route(
      path: '/search',
      factory: $SearchRouteExtension._fromState,
    );

extension $SearchRouteExtension on SearchRoute {
  static SearchRoute _fromState(GoRouterState state) => const SearchRoute();

  String get location => GoRouteData.$location(
        '/search',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $searchUserRoute => GoRouteData.$route(
      path: '/searchUser',
      factory: $SearchUserRouteExtension._fromState,
    );

extension $SearchUserRouteExtension on SearchUserRoute {
  static SearchUserRoute _fromState(GoRouterState state) =>
      const SearchUserRoute();

  String get location => GoRouteData.$location(
        '/searchUser',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $viewUserRoute => GoRouteData.$route(
      path: '/viewUser',
      factory: $ViewUserRouteExtension._fromState,
    );

extension $ViewUserRouteExtension on ViewUserRoute {
  static ViewUserRoute _fromState(GoRouterState state) => const ViewUserRoute();

  String get location => GoRouteData.$location(
        '/viewUser',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $artistViewRoute => GoRouteData.$route(
      path: '/artist',
      name: 'artistView',
      factory: $ArtistViewRouteExtension._fromState,
    );

extension $ArtistViewRouteExtension on ArtistViewRoute {
  static ArtistViewRoute _fromState(GoRouterState state) =>
      const ArtistViewRoute();

  String get location => GoRouteData.$location(
        '/artist',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $albumViewRoute => GoRouteData.$route(
      path: '/album',
      name: 'albumView',
      factory: $AlbumViewRouteExtension._fromState,
    );

extension $AlbumViewRouteExtension on AlbumViewRoute {
  static AlbumViewRoute _fromState(GoRouterState state) =>
      const AlbumViewRoute();

  String get location => GoRouteData.$location(
        '/album',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $trackViewRoute => GoRouteData.$route(
      path: '/track',
      name: 'trackView',
      factory: $TrackViewRouteExtension._fromState,
    );

extension $TrackViewRouteExtension on TrackViewRoute {
  static TrackViewRoute _fromState(GoRouterState state) =>
      const TrackViewRoute();

  String get location => GoRouteData.$location(
        '/track',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}
