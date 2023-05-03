import 'package:dio/dio.dart';

class ApiService {
  final _baseUrl = 'https://rickandmortyapi.com/api/';
  final Dio _dio;

  ApiService(this._dio);

  Future<Map<String,dynamic>> get({required String endPoint, Map<String,dynamic>? queryParameters  }) async {
    var response = await _dio.get('$_baseUrl$endPoint',queryParameters:queryParameters );
    //print(response.data);
    return response.data;
  }
}