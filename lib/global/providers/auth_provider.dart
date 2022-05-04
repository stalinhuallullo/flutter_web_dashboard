import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_web_dashboard_multiempresas/global/api/endpoints.dart';
import 'package:flutter_web_dashboard_multiempresas/global/models/auth/auth_response.dart';
import 'package:flutter_web_dashboard_multiempresas/global/models/auth/usuario.dart';
import 'package:flutter_web_dashboard_multiempresas/global/router/route.dart';
import 'package:flutter_web_dashboard_multiempresas/global/services/local_storage.dart';
import 'package:flutter_web_dashboard_multiempresas/global/services/notifications_service.dart';
import 'package:flutter_web_dashboard_multiempresas/global/services/navigation_service.dart';

enum AuthStatus {
  checking,
  authenticated,
  notAuthenticated
}

class AuthProvider extends ChangeNotifier {

  String? _token;
  AuthStatus authStatus = AuthStatus.checking;
  Usuario? user;


  AuthProvider() {
          print("AuthProvider ======= ==> " );

    isAuthenticated();
  }


  login( String username, String password ) async{
    final data = {
      'username': username,
      'password': password,
      'grant_type': "password",
      'company': "61e95b28d4b4d57bce0ee3aa",
    };


    await Api.post('oauth/token', data )
    .then( (json) {
        print("== json ==");
        print(json);
        //print(jsonDecode(json.toString())["access_token"]);

        final authResponse = AuthResponse.fromMap(jsonDecode(json.toString()));

        //this.user = authResponse.usuario;
        authStatus = AuthStatus.authenticated;
        LocalStorage.prefs.setString('access_token', authResponse.access_token );
        //LocalStorage.prefs.setString('refresh_token', authResponse.refresh_token );
        NavigationService.replaceTo(Flurorouter.homePageRoute);

        Api.configureDio();

        notifyListeners();
  
    }).catchError( (e){
      print('error en: $e');
      NotificationsService.showSnackbarError('Usuario / Password no válidos');
    });

  }

  Future<bool> isAuthenticated() async {

    final token = LocalStorage.prefs.getString('access_token');
    if( token == null ) {
      authStatus = AuthStatus.notAuthenticated;
      notifyListeners();
      return false;
    }
    authStatus = AuthStatus.authenticated;
    
    return true;
    /*
    try {
      final resp = await Api.httpGet('/auth');
      final authReponse = AuthResponse.fromMap(resp);
      LocalStorage.prefs.setString('access_token', authReponse.access_token );
      
      //this.user = authReponse.usuario;
      print("=== try4 ===");
      authStatus = AuthStatus.authenticated;
      notifyListeners();
      return true;

    } catch (e) {
      print("==ddddd= " + e.toString());
      authStatus = AuthStatus.notAuthenticated;
      notifyListeners();
      return false;
    }*/
  }

  
  logout() {
    LocalStorage.prefs.remove('access_token');
    authStatus = AuthStatus.notAuthenticated;
    notifyListeners();
  }



}
