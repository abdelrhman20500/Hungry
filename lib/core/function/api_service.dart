import 'package:dio/dio.dart';

class ApiService{
  final Dio dio;
  final baseUrl = "https://sonic-zdi0.onrender.com/api/";

  ApiService(this.dio);
  /// post method...
  Future<Response> post(String endPoint, Map<String, dynamic> data, {String? token}) async {
    var response = await dio.post(
      "$baseUrl$endPoint",
      data: data,
      options: Options(headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      }),
    );

    return response;
  }
  /// postCart method
  Future<Response> postMethod(String endPoint, Map<String, dynamic> data, String token) async {
    return await dio.post(
      '$baseUrl$endPoint',
      data: data,
      options: Options(
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
      ),
    );
  }
   /// put method
  Future<Response> putForPassword(String endPoint, Map<String, dynamic> data, String token) async {
    return await dio.put(
      '$baseUrl$endPoint',
      data: data,
      options: Options(
        headers: {
          'Content-Type': 'application/json',
          'token': token,
        },
      ),
    );
  }
 /// getCart method
  Future<Response> getCart({required String endpoint ,String? token}) async {
    var response = await dio.get("$baseUrl$endpoint",
      options:Options(headers: {
        'Content-Type': 'application/json',
        'token': token,
      }),
    );
    return response;
  }
  /// logout
  Future<Response> postLogout(String endPoint,) async {
    var response = await dio.post(
      "$baseUrl$endPoint",
      // data: data,
      options: Options(headers: {
        'Content-Type': 'application/json',
        // 'Authorization': 'Bearer $token',
      }),
    );

    return response;
  }
  /// delete method
  Future<Response> delete({required String endPoint,required String token,Map<String, dynamic>? data,}) async {
    final response = await dio.delete(
      "$baseUrl$endPoint",
      data: data,
      options: Options(
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
      ),
    );
    return response;
  }
  /// get method..
  Future<Response> get({required String endpoint ,String? token}) async {
    var response = await dio.get("$baseUrl$endpoint",
      options:Options(headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      }),
    );
    return response;
  }

 /// put Method

  Future<Response> put({required String endPoint, required String token,required Map<String, dynamic> data,}) async {
    final response = await dio.put(
      "$baseUrl$endPoint", // Full URL
      data: data,
      options: Options(
        headers: {
          'Content-Type': 'application/json',
          'token': token,
        },
      ),
    );
    return response;
  }

}

