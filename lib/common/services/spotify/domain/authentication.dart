import 'dart:developer';

import 'package:spotify/spotify.dart';
import 'package:uni_links/uni_links.dart';
import 'package:url_launcher/url_launcher.dart';

class SpotifyAuth {
  const SpotifyAuth(this._credentials);

  static const url = 'http://mumagweb.com/auth';
  static final scopes = [AuthorizationScope.library.read];

  final SpotifyApiCredentials _credentials;

  Future<void> connect() async {
    final grant = SpotifyApi.authorizationCodeGrant(_credentials);

    final authUri = grant.getAuthorizationUrl(
      Uri.parse(url),
      scopes: [...scopes],
    );

    try {
      if (await canLaunchUrl(authUri)) {
        await launchUrl(authUri);
      }

      var responseUri = '';

      linkStream.listen((String? link) async {
        log('VIM PRA CÁ ANTES');
        log('VIM PRA CÁ ANTES');
        log('VIM PRA CÁ ANTES');
        if (link != null && link.startsWith(authUri.toString())) {
          responseUri = link;
          log('VIM PRA CÁ');
          log('VIM PRA CÁ');
          log('VIM PRA CÁ');
          final spotify = SpotifyApi.fromAuthCodeGrant(grant, responseUri);
        }

        /* if (responseUri.isNotEmpty) {
          final spotify = SpotifyApi.fromAuthCodeGrant(grant, responseUri);
        } */
      });
    } catch (e) {
      rethrow;
    }
  }

  Future<SpotifyApi?> getUserAuthenticatedSpotifyApi() async {
    try {
      var grant = SpotifyApi.authorizationCodeGrant(_credentials);
      var authUri =
          grant.getAuthorizationUrl(Uri.parse(url), scopes: [...scopes]);

      print(
          'Please paste this url \n\n$authUri\n\nto your browser and enter the redirected url:');

      Uri? redirectUrl;
      var userInput = url;
      if ((redirectUrl = Uri.tryParse(userInput)) == null) {
        print('Invalid redirect url');
        return null;
      }

      var client =
          await grant.handleAuthorizationResponse(redirectUrl!.queryParameters);
      return SpotifyApi.fromClient(client);
    } catch (e) {
      rethrow;
    }
  }
}
