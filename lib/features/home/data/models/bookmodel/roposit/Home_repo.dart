import 'package:bookly_app/core/Error/failure.dart';
import 'package:bookly_app/features/home/data/models/bookmodel/bookmodel.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<Bookmodel>>> fetchNewsetBooks();
  Future<Either<Failure, List<Bookmodel>>> fetchPythonBooks();
  Future<Either<Failure, List<Bookmodel>>> fetchSimellerBooks({required String catagory});
}
