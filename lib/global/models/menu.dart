import 'dart:convert';

class Menu{
  final String rute;
  final String name;
  Menu({required this.rute, required this.name});


  factory Menu.fromJson(Map<String, dynamic> data) => Menu(
    rute: data['rute'] as String, 
    name: data['name'] as String
  );

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => {
        "rute": rute,
        "name": name
    };
}