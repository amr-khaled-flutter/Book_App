import 'package:dio/dio.dart';

class Apisevices {
  final Dio dio;
  Apisevices(this.dio);
  final _baseurl = 'https://www.googleapis.com/books/v1/';

  Future<Map<String, dynamic>> get({required String endpoints}) async {
    Response response = await dio.get('$_baseurl$endpoints');

    return response.data;
  }
}
