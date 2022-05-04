import 'dart:convert';


class CompanyAdmin{

  

  CompanyAdmin({
    required this.typeDocument,
    required this.numberDocument,
    required this.firstName,
    required this.lastName,
    required this.email,
  });

  int typeDocument;
  int numberDocument;
  String firstName;
  String lastName;
  String email;


  factory CompanyAdmin.fromJson(String str) => CompanyAdmin.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());


  factory CompanyAdmin.fromMap(Map<String, dynamic> json) => CompanyAdmin(
    typeDocument: json["typeDocument"],
    numberDocument: json["numberDocument"],
    firstName: json["firstName"],
    lastName: json["lastName"],
    email: json["email"],
  );

  Map<String, dynamic> toMap() => {
    "typeDocument": typeDocument,
    "numberDocument": numberDocument,
    "firstName": firstName,
    "lastName": lastName,
    "email": email,
  };

}