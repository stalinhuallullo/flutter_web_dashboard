import 'package:flutter/material.dart';
import 'package:flutter_web_dashboard_multiempresas/global/api/endpoints.dart';
import 'package:flutter_web_dashboard_multiempresas/global/providers/auth_provider.dart';
import 'package:flutter_web_dashboard_multiempresas/global/providers/companies/companies_form_provider.dart';
import 'package:flutter_web_dashboard_multiempresas/global/providers/companies/companies_provider.dart';
import 'package:flutter_web_dashboard_multiempresas/global/providers/sidemenu_provider.dart';
import 'package:flutter_web_dashboard_multiempresas/global/router/route.dart';
import 'package:flutter_web_dashboard_multiempresas/global/services/local_storage.dart';
import 'package:flutter_web_dashboard_multiempresas/global/services/navigation_service.dart';
import 'package:flutter_web_dashboard_multiempresas/global/services/notifications_service.dart';
import 'package:flutter_web_dashboard_multiempresas/locator.dart';
import 'package:flutter_web_dashboard_multiempresas/ui/layouts/auth/authentication_layout.dart';
import 'package:flutter_web_dashboard_multiempresas/ui/layouts/dashboard/dashboard_layout.dart';
import 'package:flutter_web_dashboard_multiempresas/ui/layouts/splash/splash_layout.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

void main() async {
  await LocalStorage.configurePrefs();
  Flurorouter.configureRoutes();
  Api.configureDio();
  setUpLocator();

  //setPathUrlStrategy();
  runApp(const AppState());
}


class AppState extends StatelessWidget {
  const AppState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(lazy: false, create: ( _ ) => AuthProvider() ),
        ChangeNotifierProvider(lazy: false, create: ( _ ) => SideMenuProvider() ),
        ChangeNotifierProvider(create: ( _ ) => CompaniesProvider() ),
        ChangeNotifierProvider(create: ( _ ) => CompaniesFormProvider() ),
        
      ],
      child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Landing Page",
      initialRoute: Flurorouter.authenticationPageRoute,
      onGenerateRoute: (routeSettings) => Flurorouter.router.generator(routeSettings),
      navigatorKey: NavigationService.navigatorKey,
      scaffoldMessengerKey: NotificationsService.messengerKey,
      builder: ( _, child ) {
        print("object");
        //return AuthenticationLayout( child: child! );
        final authProvider = Provider.of<AuthProvider>(context);

        if ( authProvider.authStatus == AuthStatus.checking ) return SplashLayout();
        
        if( authProvider.authStatus == AuthStatus.authenticated ) {
          return DashboardLayout( child: child! );
        } else {
          return AuthenticationLayout( child: child! );
        }
      },
      theme: ThemeData.light().copyWith(
        scrollbarTheme: const ScrollbarThemeData().copyWith(
          thumbColor: MaterialStateProperty.all(
            Colors.grey.withOpacity(0.5)
          )
        )
      ),
    );
  }
}
