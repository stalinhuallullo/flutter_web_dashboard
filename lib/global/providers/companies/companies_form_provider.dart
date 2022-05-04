import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_web_dashboard_multiempresas/global/models/company/company.dart';
import 'package:flutter_web_dashboard_multiempresas/global/models/company/company_admin.dart';

import 'package:flutter_web_dashboard_multiempresas/global/models/company/company_admin_request.dart';

class CompaniesFormProvider extends ChangeNotifier {

  CompanyAdminRequest? companyRequest;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  

  copyUserWith({
      Company? company,
      CompanyAdmin? admin,
    }) {
      companyRequest = CompanyAdminRequest(
        company: company ?? companyRequest!.company,
        admin: admin ?? companyRequest!.admin,
      );
      notifyListeners();
    }

  bool _validForm() {
    return formKey.currentState!.validate();
  }

  Future registerCompany() async {
    if ( !this._validForm() ) return false;



    final data = companyRequest;

    return false;
    /*try {
      
      final resp = await Api.put('/usuarios/${ user!.uid }', data);
      print( resp );
      return true;

    } catch (e) {
      print('error en updateUser: $e');
      return false;
    }*/


  }
  

}