import 'package:fluro/fluro.dart';
import 'package:flutter_web_dashboard/global/providers/auth_provider.dart';
import 'package:flutter_web_dashboard/ui/layouts/auth/widgets/login_view.dart';
import 'package:flutter_web_dashboard/ui/views/home/home_view.dart';
import 'package:provider/provider.dart';

class RolesHandlers{

  static Handler index = Handler(
    handlerFunc: ( context, params ) {

      final authProvider = Provider.of<AuthProvider>(context!);
      if ( authProvider.authStatus == AuthStatus.authenticated ){
        print("HomeView ==> ");
        return HomeView();
      }
        
      else {
        print("LoginView ==> ");
        return LoginView();
      }
    }
  );


}