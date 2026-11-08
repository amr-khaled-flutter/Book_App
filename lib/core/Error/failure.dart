import 'package:dio/dio.dart';

 class Failure {
  final String errormsg;

  const Failure(this.errormsg);
}

class unexpectedfailure extends Failure {
  unexpectedfailure(super.errormsg);
}
class Serverfailure extends Failure {
  Serverfailure(super.errormsg);

  factory Serverfailure.fromDioerror(DioException dioerror) {

    switch (dioerror.type) {
      case DioExceptionType.connectionTimeout:
        return Serverfailure('Connection timeout with Apiserver');

      case DioExceptionType.sendTimeout:
        return Serverfailure('Send timeout with Apiserver');

      case DioExceptionType.receiveTimeout:
        return Serverfailure('Receive timeout with Apiserver');

      case DioExceptionType.badResponse:
        return Serverfailure.fromResponse(
          dioerror.response!.statusCode!,
          dioerror.response!,
        );

      case DioExceptionType.connectionError:
        return Serverfailure('Request to Apiserver has a connection error');

      case DioExceptionType.cancel:
        return Serverfailure('Request to Apiserver was cancelled');

      case DioExceptionType.badCertificate:
        return Serverfailure('Bad Certificate');

      case DioExceptionType.unknown:
        if (dioerror.message?.contains('SocketException') ?? false) {
          return Serverfailure('No Internet Connection');
        }
        return Serverfailure(dioerror.message ?? 'Unexpected Error');

      case DioExceptionType.transformTimeout:
        return Serverfailure('Response transformation timeout');
    }
  }

  factory Serverfailure.fromResponse(int statuscode, Response response) {
    if (statuscode == 400 || statuscode == 401 || statuscode == 403) {
      return Serverfailure(
        response.data['error']['message'],
      );
    } else if (statuscode == 404) {
      return Serverfailure('Your request not found, please try again');
    } else if (statuscode == 500) {
      return Serverfailure('Server Error, please try again');
    } else {
      return Serverfailure('Oops, there was an error, please try again');
    }
  }
}