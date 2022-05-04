
import 'package:flutter_web_dashboard_multiempresas/global/services/local_storage.dart';

class Functions {



  static getTokenSesion() => LocalStorage.prefs.getString('access_token');


}