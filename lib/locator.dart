import 'package:flutter_web_dashboard_multiempresas/global/services/navigation_service.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;



void setUpLocator(){
  locator.registerLazySingleton(() => NavigationService());
}