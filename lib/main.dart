import 'package:flutter/material.dart';
import 'package:flutter_web_dashboard/global/api/endpoints.dart';
import 'package:flutter_web_dashboard/global/providers/auth_provider.dart';
import 'package:flutter_web_dashboard/global/providers/sidemenu_provider.dart';
import 'package:flutter_web_dashboard/global/router/routers.dart';
import 'package:flutter_web_dashboard/global/services/local_storage.dart';
import 'package:flutter_web_dashboard/global/services/navigation_service.dart';
import 'package:flutter_web_dashboard/global/services/notifications_service.dart';
import 'package:flutter_web_dashboard/ui/layouts/auth/authentication_layout.dart';
import 'package:flutter_web_dashboard/ui/layouts/dashboard/dashboard_layout.dart';
import 'package:flutter_web_dashboard/ui/layouts/splash/splash_layout.dart';
import 'package:provider/provider.dart';

void main() async {
  await LocalStorage.configurePrefs();
  Flurorouters.configurationRouter();

  Api.configureDio();
  runApp(AppState());
}


class AppState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(lazy: false, create: ( _ ) => AuthProvider()),
        ChangeNotifierProvider(lazy: false, create: ( _ ) => SideMenuProvider() ),
      ],
      child: MyApp(),
    );
  }
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Landing Page",
      initialRoute: Flurorouters.rootRoute,
      onGenerateRoute: (routeSettings) => Flurorouters.router.generator(routeSettings),
      navigatorKey: NavigationService.navigatorKey,
      scaffoldMessengerKey: NotificationsService.messengerKey,
      builder: ( _, child ) {
        
        //return AuthenticationLayout( child: child! );
        final authProvider = Provider.of<AuthProvider>(context);
        if ( authProvider.authStatus == AuthStatus.checking ) {
          print("authProvider ==> " + authProvider.authStatus.toString());
          return SplashLayout();
        }
        
        if( authProvider.authStatus == AuthStatus.authenticated ) {
          print("authProvider ==> " + authProvider.authStatus.toString());  
          return DashboardLayout( child: child! );
        }
        else {
          print("AuthenticationLayout");  
          return AuthenticationLayout( child: child! );
        }
        //return AuthenticationLayout(child: child!);
      },
    );
  }
}