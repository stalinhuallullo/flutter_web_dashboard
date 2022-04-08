import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_dashboard/global/api/endpoints.dart';
import 'package:flutter_web_dashboard/global/models/http/Usuario.dart';
import 'package:flutter_web_dashboard/global/models/http/auth_response.dart';
import 'package:flutter_web_dashboard/global/router/routers.dart';
import 'package:flutter_web_dashboard/global/services/local_storage.dart';
import 'package:flutter_web_dashboard/global/services/navigation_service.dart';
import 'package:flutter_web_dashboard/global/services/notifications_service.dart';

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
    this.isAuthenticated();
  }


  login( String username, String password ) {

    final data = {
      'username': "admin_xav_dat",
      'password': "1234",
      'grant_type': "password"
    };

    print("data ==> " + data.toString());
    // TODO: Petición HTTP
    Api.post('/oauth/token', data ).then(
      (json) {
        print(json);
        final authResponse = AuthResponse.fromMap(json);

        //this.user = authResponse.usuario;
print("=== authResponse ===");
print(authResponse);
//print(authResponse.token);
        /*authStatus = AuthStatus.authenticated;
        LocalStorage.prefs.setString('token', authResponse.token );
        NavigationService.replaceTo(Flurorouters.homeRoute);*/

        Api.configureDio();

        notifyListeners();

      }
      
    ).catchError( (e){
      print('error en: $e');
      NotificationsService.showSnackbarError('Usuario / Password no válidos');
    });

    /*this._token = 'adjkfhadfyiu12y3hjasd.ajskhdaks.kjshdkjas';
    LocalStorage.prefs.setString('token', this._token! );
    
    authStatus = AuthStatus.authenticated;
    notifyListeners();
    
    NavigationService.replaceTo(Flurorouters.homeRoute);*/
  }

  Future<bool> isAuthenticated() async {

    print("isAuthenticated");
    final token = LocalStorage.prefs.getString('token');

    if( token == null ) {
      authStatus = AuthStatus.notAuthenticated;
      notifyListeners();
      return false;
    }
    
    try {
      final resp = await Api.httpGet('/auth');
      final authReponse = AuthResponse.fromMap(resp);
      LocalStorage.prefs.setString('token', authReponse.token );
      
      this.user = authReponse.usuario;
      authStatus = AuthStatus.authenticated;
      notifyListeners();
      return true;

    } catch (e) {
      print(e);
      authStatus = AuthStatus.notAuthenticated;
      notifyListeners();
      return false;
    }
  }

  
  logout() {
    LocalStorage.prefs.remove('token');
    authStatus = AuthStatus.notAuthenticated;
    notifyListeners();
  }



}
