import 'dart:convert';

import 'package:flutter_web_dashboard_multiempresas/global/models/company/company.dart';
import 'package:flutter_web_dashboard_multiempresas/global/models/company/company_admin.dart';

class CompanyAdminRequest{

  CompanyAdminRequest({
    required this.company,
    required this.admin,
  });

  Company company;
  CompanyAdmin admin;

  factory CompanyAdminRequest.fromJson(String str) => CompanyAdminRequest.fromMap(json.decode(str));
    String toJson() => json.encode(toMap());


  factory CompanyAdminRequest.fromMap(Map<String, dynamic> json) => CompanyAdminRequest(
    company: Company.fromMap(json["company"]),
    admin: CompanyAdmin.fromMap(json["admin"]),
  );


  Map<String, dynamic> toMap() => {
    "company": company,
    "admin": admin,
  };

}