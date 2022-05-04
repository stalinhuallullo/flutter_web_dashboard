
import 'dart:convert';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter_web_dashboard_multiempresas/global/constants/constant.dart';
import 'package:flutter_web_dashboard_multiempresas/global/utils/functions.dart';

class Api {

  static final Dio _dio = Dio();
  static String username = 'app-security-data'; //'xav-data-ws';
  static String password = 'as466gf'; //'1234';

  static void configureDio() {

    // Base del url
    _dio.options.baseUrl = "https://api.xavierdata.pe/"; //'http://localhost:1513/api'; // http://45.79.194.50:8050/
    _dio.options.headers["authorization"] = Constants.HTTP_AUTH_BASIC  + base64Encode(utf8.encode('$username:$password'));
  }

  static Future httpGet( String path ) async {
    try {
      
    _dio.options.headers["authorization"] = Constants.HTTP_AUTH_BEARER + Functions.getTokenSesion();

      final resp = await _dio.get(path);
      //print("========= httpGet ========");
      //print(resp);
      return resp;


    } on DioError catch (e) {
      print(e.response);
      throw('Error en el GET');
    }
  }

  static Future post( String path, Map<String, dynamic> data ) async {
      FormData  formData = FormData.fromMap(data);

      try {
        
        var resp = await _dio.post(path, data: formData);
        return resp;

      } on DioError catch (e) {
        print(e);
        throw('Error en el POST');
      }
    }


    static Future put( String path, Map<String, dynamic> data ) async {

      final formData = FormData.fromMap(data);

      try {
        
        final resp = await _dio.put(path, data: formData );
        return resp.data;

      } on DioError catch (e) {
        print(e);
        throw('Error en el PUT $e');
      }
    }


    static Future delete( String path, Map<String, dynamic> data ) async {

      final formData = FormData.fromMap(data);

      try {
        
        final resp = await _dio.delete(path, data: formData );
        return resp.data;

      } on DioError catch (e) {
        print(e);
        throw('Error en el delete');
      }
    }



  static Future uploadFile( String path, Uint8List bytes ) async {

      final formData = FormData.fromMap({
        'archivo': MultipartFile.fromBytes(bytes)
      });

      try {
        
        final resp = await _dio.put(
          path, 
          data: formData 
        );
        
        return resp.data;

      } on DioError catch (e) {
        print(e);
        throw('Error en el PUT $e');
      }
    }

}