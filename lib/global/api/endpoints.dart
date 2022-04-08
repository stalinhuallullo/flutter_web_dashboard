
import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter_web_dashboard/global/services/local_storage.dart';
import 'package:dio/dio.dart';

class Api {

  static Dio _dio = new Dio();
  //static String baseUrl = "https://api.xavierdata.pe:443/";
  static String username = 'xav-data-ws';
  static String password = '1234';

  static void configureDio() {

    // Base del url
     _dio.options.baseUrl = "https://api.xavierdata.pe:443/"; //'http://localhost:1513/api';
    //_dio.options.baseUrl = '';

    // Configurar Headers
    /*_dio.options.headers = {
      'x-token': LocalStorage.prefs.getString('token') ?? ''
    };*/

    _dio.options.headers['content-Type'] = 'multipart/form-data';
    _dio.options.headers['Access-Control-Allow-Origin'] = "*";
    _dio.options.headers['Access-Control-Allow-Credentials'] = "true";
    _dio.options.headers['Access-Control-Allow-Methods'] = "GET,HEAD,OPTIONS,POST,PUT";
    _dio.options.headers['Access-Control-Allow-Headers'] = "Access-Control-Allow-Headers, Origin,Accept, X-Requested-With, Content-Type, Access-Control-Request-Method, Access-Control-Request-Headers";
    _dio.options.headers["authorization"] = 'Basic ' + base64Encode(utf8.encode('$username:$password'));

  }

  static Future httpGet( String path ) async {
    try {
      
      final resp = await _dio.get(path);

      return resp.data;


    } on DioError catch (e) {
      print(e.response);
      throw('Error en el GET');
    }
  }

  static Future post( String path, Map<String, dynamic> data ) async {

      final formData = FormData.fromMap(data);

      try {
        
        final resp = await _dio.post(path, data: formData );
        return resp.data;

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