import 'dart:convert';

class Resource {
    Resource({
        required this.name,
    });

    String name;

    factory Resource.fromJson(String str) => Resource.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Resource.fromMap(Map<String, dynamic> json) => Resource(
        name: json["name"],
    );

    Map<String, dynamic> toMap() => {
        "name": name,
    };

  @override
  String toString() {
    return 'Resource: ${ this.name }';
  }
}




