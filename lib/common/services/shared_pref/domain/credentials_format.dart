import 'dart:convert';

class CredentialsFormat {
  final String accessToken;
  final String refreshToken;
  final List<String> scopes;

  CredentialsFormat({
    required this.accessToken,
    required this.refreshToken,
    required this.scopes,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'accessToken': accessToken,
      'refreshToken': refreshToken,
      'scopes': scopes,
    };
  }

  factory CredentialsFormat.fromMap(Map<String, dynamic> map) {
    return CredentialsFormat(
      accessToken: map['accessToken'] as String,
      refreshToken: map['refreshToken'] as String,
      scopes: List<String>.from(
        (map['scopes'] as List<dynamic>),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory CredentialsFormat.fromJson(String source) =>
      CredentialsFormat.fromMap(json.decode(source) as Map<String, dynamic>);
}
