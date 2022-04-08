import 'package:fluro/fluro.dart';
import 'package:flutter_web_dashboard/global/providers/auth_provider.dart';
import 'package:flutter_web_dashboard/global/router/routers.dart';
import 'package:flutter_web_dashboard/global/services/navigation_service.dart';
import 'package:flutter_web_dashboard/ui/layouts/auth/widgets/login_view.dart';
import 'package:flutter_web_dashboard/ui/views/home/home_view.dart';
import 'package:provider/provider.dart';

class AuthHandlers{

  static Handler login = Handler(
    handlerFunc: (context, parameters) {

      final authProvider = Provider.of<AuthProvider>(context!);

      if ( authProvider.authStatus == AuthStatus.notAuthenticated ) { 
        print("AuthHandlers ==> LoginView");

        return LoginView(); 
      }
      else { 
        print("AuthHandlers ==> HomeView" );
        //NavigationService.replaceTo(Flurorouters.homeRoute);
        //return null;
        return HomeView(); 
      }

    }
  );

}