import 'dart:convert';

class RegisteredRedirectUris {
    RegisteredRedirectUris({
        required this.name,
    });

    String name;

    factory RegisteredRedirectUris.fromJson(String str) => RegisteredRedirectUris.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory RegisteredRedirectUris.fromMap(Map<String, dynamic> json) => RegisteredRedirectUris(
        name: json["name"],
    );

    Map<String, dynamic> toMap() => {
        "name": name,
    };

}




