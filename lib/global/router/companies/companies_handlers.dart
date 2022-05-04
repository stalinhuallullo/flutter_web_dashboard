import 'package:fluro/fluro.dart';
import 'package:flutter_web_dashboard_multiempresas/ui/views/companies/index.dart';

class CompaniesHandlers{

  static Handler index = Handler(
    handlerFunc: ( context, params ) {
        print("primero");

      return CompaniesView(); 
    }
  );


}