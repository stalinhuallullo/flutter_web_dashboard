import 'dart:convert';

class AuthorizedGrantTypes {
    AuthorizedGrantTypes({
        required this.name,
    });

    String name;

    factory AuthorizedGrantTypes.fromJson(String str) => AuthorizedGrantTypes.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory AuthorizedGrantTypes.fromMap(Map<String, dynamic> json) => AuthorizedGrantTypes(
        name: json["name"],
    );

    Map<String, dynamic> toMap() => {
        "name": name,
    };

}




