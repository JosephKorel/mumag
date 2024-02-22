import 'package:flutter/src/widgets/framework.dart';
import 'package:go_router/go_router.dart';
import 'package:mumag/common/models/rating/rating_entity.dart';
import 'package:mumag/common/widgets/splash.dart';
import 'package:mumag/features/album_view/presentation/ui/main.dart';
import 'package:mumag/features/artist_view/ui/main.dart';
import 'package:mumag/features/connect/presentation/ui/main.dart';
import 'package:mumag/features/home/main.dart';
import 'package:mumag/features/my_ratings/presentation/ui/main.dart';
import 'package:mumag/features/profile/presentation/ui/main.dart';
import 'package:mumag/features/search/presentation/ui/main.dart';
import 'package:mumag/features/search/search_user/main.dart';
import 'package:mumag/features/sign_in/presentation/ui/main.dart';
import 'package:mumag/features/suggestion/presentation/ui/main.dart';
import 'package:mumag/features/track_view/presentation/ui/main.dart';
import 'package:mumag/features/view_profile/presentation/ui/main.dart';

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

@TypedGoRoute<HomeRoute>(path: '/home')
class HomeRoute extends GoRouteData {
  const HomeRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const AppMainPage();
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

@TypedGoRoute<MyRatingsRoute>(path: '/my-ratings')
class MyRatingsRoute extends GoRouteData {
  const MyRatingsRoute({this.type, this.rating});

  final RatingType? type;
  final int? rating;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return AllUserRatingsView(
      rating: rating,
      type: type,
    );
  }
}

@TypedGoRoute<SearchRoute>(path: '/search')
class SearchRoute extends GoRouteData {
  const SearchRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const SearchView();
  }
}

@TypedGoRoute<SearchUserRoute>(path: '/searchUser')
class SearchUserRoute extends GoRouteData {
  const SearchUserRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const SearchForUserView();
  }
}

@TypedGoRoute<ViewUserRoute>(path: '/viewUser')
class ViewUserRoute extends GoRouteData {
  const ViewUserRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const ViewUserProfileView();
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

@TypedGoRoute<SuggestionViewRoute>(
  path: '/suggestions',
  name: 'suggestionsView',
)
class SuggestionViewRoute extends GoRouteData {
  const SuggestionViewRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const MySugggestionsView();
  }
}
