// To parse this JSON data, do
//
//     final CompaniesResponse = CompaniesResponseFromMap(jsonString);
import 'dart:convert';

import 'package:flutter_web_dashboard_multiempresas/global/models/company/company.dart';

class CompaniesResponse {
    CompaniesResponse({
        required this.total,
        required this.companies,
    });

    int total;
    List<Company> companies;

    factory CompaniesResponse.fromJson(String str) => CompaniesResponse.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory CompaniesResponse.fromMap(Map<String, dynamic> json) => CompaniesResponse(
        total: json["total"],
        companies: List<Company>.from(json["companies"].map((x) => Company.fromMap(x))),
    );


    factory CompaniesResponse.prueba(List json) => CompaniesResponse(
        total: 15,
        companies: List<Company>.from(json.map((x) => Company.fromMap(x))),
    );
/*companies: (json.data as List)
          .map((x) => Company.fromMap(x))
          .toList(),*/

    Map<String, dynamic> toMap() => {
        "total": total,
        "companies": List<dynamic>.from(companies.map((x) => x.toMap())),
    };
}


