
import 'package:fluro/fluro.dart';
import 'package:flutter_web_dashboard_multiempresas/global/models/menu/menuItem.dart';
import 'package:flutter_web_dashboard_multiempresas/global/router/auth/auth_routers_handlers.dart';
import 'package:flutter_web_dashboard_multiempresas/global/router/companies/companies_handlers.dart';
import 'package:flutter_web_dashboard_multiempresas/global/router/home/home_handlers.dart';
import 'package:flutter_web_dashboard_multiempresas/global/router/nopage/no_page_found_handlers.dart';

class Flurorouter {

  static final FluroRouter router = FluroRouter();

  static const String rootPageRoute     = '/';

  // Auth Router
  static const String authenticationPageRoute    = '/auth/login';
  static const String registerPageRoute = '/auth/register';

  // Dashboard
  static const String homePageRoute  = '/home';
  static const String homePageDisplayName = "Inicio";
  
  // General Data
  static const String generalDataPageRoute = "/general-data";
  static const String generalDataPageDisplayName = "Generales";

  // Companies
  static const String companiesPageRoute = "/companies";
  static const String companiesPageDisplayName = "Empresas";

  // Apis
  static const String apisPageRoute = "/apis";
  static const String apisPageDisplayName = "Apis";

  // Roles
  static const String rolesPageRoute = "/roles";
  static const String rolesPageDisplayName = "Roles";

  // Users
  static const String usersPageRoute = "/users";
  static const String usersPageDisplayName = "Usuarios";

  // Reports
  static const String reportsPageRoute = "/reports";
  static const String reportsPageDisplayName = "Reportes";

  // Log out
  static const String logOutPageRoute = "/auth/log-out";
  static const String logOutPageDisplayName = "Cerrar Sesión";


  static List<MenuItem> sideMenuItemRoutes = [
    MenuItem(homePageDisplayName, homePageRoute),
    MenuItem(generalDataPageDisplayName, generalDataPageRoute),
    MenuItem(companiesPageDisplayName, companiesPageRoute),
    MenuItem(apisPageDisplayName, apisPageRoute),
    MenuItem(rolesPageDisplayName, rolesPageRoute),
    MenuItem(usersPageDisplayName, usersPageRoute),
    MenuItem(reportsPageDisplayName, reportsPageRoute),
    MenuItem(logOutPageDisplayName, logOutPageRoute)
  ];

  static void configureRoutes() {
    // Auth Routers
    router.define(rootPageRoute, handler: AuthHandlers.login, transitionType: TransitionType.none);
    router.define(authenticationPageRoute, handler: AuthHandlers.login, transitionType: TransitionType.none);

    // Dashboard
    router.define(homePageRoute, handler: HomeHandlers.home, transitionType: TransitionType.fadeIn );
    // General Data
    //router.define(generalDataPageRoute, handler: GeneralDataHandlers.index, transitionType: TransitionType.fadeIn );
    // Companies
    router.define(companiesPageRoute, handler: CompaniesHandlers.index, transitionType: TransitionType.fadeIn );
    // Apis
    //router.define(apisPageRoute, handler: ApisHandlers.index, transitionType: TransitionType.fadeIn );
    // Roles
    //router.define(rolesPageRoute, handler: RolesHandlers.index, transitionType: TransitionType.fadeIn );
    // Users
    //router.define(usersPageRoute, handler: UsersHandlers.index, transitionType: TransitionType.fadeIn );
    // Reports
    //router.define(reportsPageRoute, handler: ReportsHandlers.index, transitionType: TransitionType.fadeIn );
    // Reports
    //router.define(reportsPageRoute, handler: ReportsHandlers.index, transitionType: TransitionType.fadeIn );

    // 404
    router.notFoundHandler = NoPageFoundHandlers.noPageFound;
  }
}