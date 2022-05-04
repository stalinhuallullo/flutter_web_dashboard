import 'package:fluro/fluro.dart';
import 'package:flutter_web_dashboard_multiempresas/global/providers/auth_provider.dart';
import 'package:flutter_web_dashboard_multiempresas/ui/views/auth/login_view.dart';
import 'package:flutter_web_dashboard_multiempresas/ui/views/home/home_view.dart';
import 'package:provider/provider.dart';

class AuthHandlers{

  static Handler login = Handler(
    handlerFunc: (context, parameters) {
      final authProvider = Provider.of<AuthProvider>(context!);

      if ( authProvider.authStatus == AuthStatus.notAuthenticated ) {
        return LoginView();
      } else {
        return HomeView();
      }
/*
      final authProvider = Provider.of<AuthProvider>(context!);
      Provider.of<SideMenuProvider>(context, listen: false).setCurrentPageUrl( Flurorouters.authenticationPageRoute );

      if ( authProvider.authStatus == AuthStatus.notAuthenticated ) { 
        print("AuthHandlers ==> LoginView");

        return LoginView(); 
      }
      else { 
        print("AuthHandlers ==> HomeView" );
        locator<NavigationService>().navigatorTo(Flurorouters.homePageRoute);
        return null;
        //return HomeView(); 
      }*/

    }
  );

}