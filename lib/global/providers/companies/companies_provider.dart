import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_dashboard_multiempresas/global/api/endpoints.dart';

import 'package:flutter_web_dashboard_multiempresas/global/models/company/company.dart';
import 'package:flutter_web_dashboard_multiempresas/global/models/https/companies_response.dart';

class CompaniesProvider extends ChangeNotifier {

  List<Company> companies = [];
  


  getCategories() async {
    final resp = await Api.httpGet('api/v1/multi-companies');
    //categorias = resp;


    //print(resp.data);

    /*(resp.data as List)
          .map((x) => print(x["contactEmail"]))
          .toList();*/
    try {
      final companiesResp = CompaniesResponse.prueba(resp.data);
      companies = companiesResp.companies;
      
    } catch (e) {
      print(e);
    }

    notifyListeners();
  }


}