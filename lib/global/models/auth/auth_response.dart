import 'dart:convert';


class AuthResponse {
    AuthResponse({
        required this.access_token,
        required this.token_type,
        this.refresh_token,
        required this.expires_in,
        required this.scope,
        required this.user,
        required this.jti,
    });

    String access_token;
    String token_type;
    String? refresh_token = "";
    int expires_in;
    String scope;
    String user; // Usuario
    String jti;

    factory AuthResponse.fromJson(String str) => AuthResponse.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

/*
{
    "access_token": "eyJhbGciOiJIUzI1NiIsInR5cCI6Ik",
    "token_type": "bearer",
    "expires_in":21599,
    "scope": "read write",
    "user": "eTIzNDEyMzUifQ==",
    "jti": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9iji89TylrYazAprk0"
}
*/
    factory AuthResponse.fromMap(json) => AuthResponse(
      
        //usuario: Usuario.fromMap(json["usuario"]),
        access_token: json["access_token"],
        token_type: json["token_type"],
        refresh_token: json["refresh_token"] ?? '',
        expires_in: json["expires_in"],
        scope: json["scope"],
        user: json["user"],
        jti: json["jti"],
    );

    Map<String, dynamic> toMap() => {
        //"usuario": usuario.toMap(),
        "access_token": access_token,
        "token_type": token_type,
        "refresh_token": refresh_token,
        "expires_in": expires_in,
        "scope": scope,
        "user": user,
        "jti": jti,
    };
}

