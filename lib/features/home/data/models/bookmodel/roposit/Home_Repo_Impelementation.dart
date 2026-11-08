import 'package:bookly_app/core/Error/failure.dart';
import 'package:bookly_app/core/utlis/ApiSevices.dart';
import 'package:bookly_app/features/home/data/models/bookmodel/bookmodel.dart';
import 'package:bookly_app/features/home/data/models/bookmodel/roposit/Home_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomeRepoImpelementation implements HomeRepo {
  final Apisevices apisevices;

  HomeRepoImpelementation(this.apisevices);
  @override
  Future<Either<Failure, List<Bookmodel>>> fetchNewsetBooks() async {
    try {
      Map<String, dynamic> json = await apisevices.get(
        endpoints:
            'volumes?key=AIzaSyDc_2sbmnrOqXk7miIEvTqaEq4zNau_A9s&q=subject:programming&Sorting=relevance',
      );
      List<dynamic> items = json['items'];
      List<Bookmodel> books = [];
      for (var item in items) {
        Bookmodel bookmodel = Bookmodel.fromJson(item);
        books.add(bookmodel);
      }
      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(Serverfailure.fromDioerror(e));
      }
      return left(unexpectedfailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<Bookmodel>>> fetchPythonBooks() async {
    try {
      Map<String, dynamic> json = await apisevices.get(
        endpoints:
            'volumes?key=AIzaSyDc_2sbmnrOqXk7miIEvTqaEq4zNau_A9s&q=subject:python',
      );
      List<dynamic> items = json['items'];
      List<Bookmodel> books = [];
      for (var item in items) {
        books.add(Bookmodel.fromJson(item));
      }
      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(Serverfailure.fromDioerror(e));
      }
      return left(unexpectedfailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<Bookmodel>>> fetchSimellerBooks({
    required String catagory,
  }) async {
    try {
      Map<String, dynamic> json = await Apisevices(Dio()).get(
        endpoints:
            'volumes?key=AIzaSyDc_2sbmnrOqXk7miIEvTqaEq4zNau_A9s&q=subject:programming&Sorting=relevance&Filltering=free-ebooks',
      );
      List<dynamic> items = json['items'];
      List<Bookmodel> books = [];
      for (var item in items) {
        books.add(Bookmodel.fromJson(item));
      }
      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(Serverfailure.fromDioerror(e));
      }
      return left(unexpectedfailure(e.toString()));
    }
  }
}
