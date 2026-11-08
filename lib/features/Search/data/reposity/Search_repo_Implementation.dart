import 'package:bookly_app/core/Error/failure.dart';
import 'package:bookly_app/core/utlis/ApiSevices.dart';
import 'package:bookly_app/features/Search/data/reposity/Search_repo.dart';
import 'package:bookly_app/features/home/data/models/bookmodel/bookmodel.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class SearchRepoImplementation implements SearchRepo {
  Apisevices apisevices;
  SearchRepoImplementation(this.apisevices);

  @override
  Future<Either<Failure, List<Bookmodel>>> getSearchBooks({
    required String search,
  }) async {
    try {
      Map<String, dynamic> json = await apisevices.get(
        endpoints:
            'volumes?key=AIzaSyDc_2sbmnrOqXk7miIEvTqaEq4zNau_A9s&q=subject:$search',
      );

      List<Bookmodel> books = [];
      List<dynamic> items = json['items'];
      for (var item in items) {
        Bookmodel bookmodel = Bookmodel.fromJson(item);
        books.add(bookmodel);
      }
      return (right(books));
    } catch (e) {
      if (e is DioException) {
        return left(Serverfailure.fromDioerror(e));
      }
      return left(unexpectedfailure(e.toString()));
    }
  }
}
