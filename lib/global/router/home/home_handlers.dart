import 'package:fluro/fluro.dart';
import 'package:flutter_web_dashboard_multiempresas/ui/views/home/home_view.dart';
import 'package:provider/provider.dart';

class HomeHandlers{

  static Handler home = Handler(
    handlerFunc: ( context, params ) {
        print("primero");

      return HomeView(); 
    }
  );


}