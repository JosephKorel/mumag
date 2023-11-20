import 'dart:async';
import 'dart:developer';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:mumag/common/services/spotify/domain/authentication.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:spotify/spotify.dart';
import 'package:uni_links/uni_links.dart';

part 'api.g.dart';

@riverpod
SpotifyApiCredentials clientCredentials(ClientCredentialsRef ref) {
  return SpotifyApiCredentials(
    dotenv.env['SPOTIFY_CLIENT_ID'],
    dotenv.env['SPOTIFY_CLIENT_SECRET'],
  );
}

@riverpod
SpotifyAuth spotifyAuth(SpotifyAuthRef ref) {
  return SpotifyAuth(ref.watch(clientCredentialsProvider));
}

@riverpod
SpotifyApi spotifyClient(SpotifyClientRef ref) {
  return SpotifyApi(ref.watch(clientCredentialsProvider));
}

@riverpod
StreamSubscription<Uri?> linkListener(LinkListenerRef ref) {
  log('BUILDEI');

  return uriLinkStream.listen((event) {
    log('Estou vindo pra cá');
  });
}
