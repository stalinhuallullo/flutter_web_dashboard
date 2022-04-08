import 'package:fluro/fluro.dart';
import 'package:flutter_web_dashboard/global/providers/auth_provider.dart';
import 'package:flutter_web_dashboard/global/providers/sidemenu_provider.dart';
import 'package:flutter_web_dashboard/global/router/routers.dart';
import 'package:flutter_web_dashboard/global/services/navigation_service.dart';
import 'package:flutter_web_dashboard/ui/layouts/auth/widgets/login_view.dart';
import 'package:flutter_web_dashboard/ui/views/home/home_view.dart';
import 'package:provider/provider.dart';

class HomeHandlers{

  static Handler home = Handler(
    handlerFunc: ( context, params ) {

      final authProvider = Provider.of<AuthProvider>(context!);
      Provider.of<SideMenuProvider>(context, listen: false).setCurrentPageUrl( Flurorouters.homeRoute );

      if ( authProvider.authStatus == AuthStatus.authenticated ) { 
        print("HomeHandlers ==> HomeView");
        return HomeView(); 
      }
      else { 
        print("HomeHandlers ==> LoginView");
        //NavigationService.replaceTo(Flurorouters.loginRoute);
        //return null;
        return LoginView(); 
      }
        
    }
  );


}