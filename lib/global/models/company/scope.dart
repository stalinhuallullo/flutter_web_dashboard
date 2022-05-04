import 'dart:convert';

class Scope {
    Scope({
        required this.name,
    });

    String name;

    factory Scope.fromJson(String str) => Scope.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Scope.fromMap(Map<String, dynamic> json) => Scope(
        name: json["name"],
    );

    Map<String, dynamic> toMap() => {
        "name": name,
    };

  @override
  String toString() {
    return 'Scope: ${ this.name }';
  }
}




