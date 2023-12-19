import 'package:flutter/src/widgets/framework.dart';
import 'package:go_router/go_router.dart';
import 'package:mumag/common/widgets/splash.dart';
import 'package:mumag/features/album_view/presentation/ui/main.dart';
import 'package:mumag/features/artist_view/ui/main.dart';
import 'package:mumag/features/connect/presentation/ui/main.dart';
import 'package:mumag/features/profile/presentation/ui/main.dart';
import 'package:mumag/features/sign_in/presentation/ui/main.dart';
import 'package:mumag/features/track_view/presentation/ui/main.dart';

part 'routes.g.dart';

@TypedGoRoute<SplashRoute>(path: '/splash')
class SplashRoute extends GoRouteData {
  const SplashRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const SplashView();
  }
}

@TypedGoRoute<SignInRoute>(path: '/sign-in')
class SignInRoute extends GoRouteData {
  const SignInRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const SignInView();
  }
}

@TypedGoRoute<ConnectToSpotifyRoute>(path: '/connect')
class ConnectToSpotifyRoute extends GoRouteData {
  const ConnectToSpotifyRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const ConnectToSpotifyView();
  }
}

@TypedGoRoute<ProfileRoute>(path: '/profile')
class ProfileRoute extends GoRouteData {
  const ProfileRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const ProfileView();
  }
}

@TypedGoRoute<ArtistViewRoute>(path: '/artist', name: 'artistView')
class ArtistViewRoute extends GoRouteData {
  const ArtistViewRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const ArtistMainView();
  }
}

@TypedGoRoute<AlbumViewRoute>(path: '/album', name: 'albumView')
class AlbumViewRoute extends GoRouteData {
  const AlbumViewRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const AlbumMainView();
  }
}

@TypedGoRoute<TrackViewRoute>(path: '/track', name: 'trackView')
class TrackViewRoute extends GoRouteData {
  const TrackViewRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const TrackMainView();
  }
}
