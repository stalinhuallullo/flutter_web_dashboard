import 'package:fluro/fluro.dart';
import 'package:flutter_web_dashboard/global/router/apis_handlers.dart';
import 'package:flutter_web_dashboard/global/router/auth_routers_handlers.dart';
import 'package:flutter_web_dashboard/global/router/reports_handlers.dart';
import 'package:flutter_web_dashboard/global/router/users_handlers.dart';
import 'package:flutter_web_dashboard/global/router/companies_handlers.dart';
import 'package:flutter_web_dashboard/global/router/general_data_handlers.dart';
import 'package:flutter_web_dashboard/global/router/home_handlers.dart';
import 'package:flutter_web_dashboard/global/router/no_page_found_handlers.dart';
import 'package:flutter_web_dashboard/global/router/roles_handlers.dart';


class Flurorouters {

  static final FluroRouter router = FluroRouter();

  static String rootRoute     = '/';

  // Auth Router
  static String loginRoute    = '/auth/login';
  static String registerRoute = '/auth/register';

  // Dashboard
  static String homeRoute  = '/home';
  // General Data
  static String generalDataRoute = "/general-data";
  // Companies
  static String companiesRoute = "/companies";
  // Apis
  static String apisRoute = "/apis";
  // Roles
  static String rolesRoute = "/roles";
  // Users
  static String usersRoute = "/users";
  // Reports
  static String reportsRoute = "/reports";


  static void configurationRouter() {
    // Auth Routers
    router.define(rootRoute, handler: AuthHandlers.login, transitionType: TransitionType.none);
    router.define(loginRoute, handler: AuthHandlers.login, transitionType: TransitionType.none);

    // Dashboard
    router.define(homeRoute, handler: HomeHandlers.home, transitionType: TransitionType.fadeIn );
    // General Data
    router.define(generalDataRoute, handler: GeneralDataHandlers.index, transitionType: TransitionType.fadeIn );
    // Companies
    router.define(companiesRoute, handler: CompaniesHandlers.index, transitionType: TransitionType.fadeIn );
    // Apis
    router.define(apisRoute, handler: ApisHandlers.index, transitionType: TransitionType.fadeIn );
    // Roles
    router.define(rolesRoute, handler: RolesHandlers.index, transitionType: TransitionType.fadeIn );
    // Users
    router.define(usersRoute, handler: UsersHandlers.index, transitionType: TransitionType.fadeIn );
    // Reports
    router.define(reportsRoute, handler: ReportsHandlers.index, transitionType: TransitionType.fadeIn );

    // 404
    router.notFoundHandler = NoPageFoundHandlers.noPageFound;
  }
}