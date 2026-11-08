import 'package:bookly_app/core/Error/failure.dart';
import 'package:bookly_app/features/home/data/models/bookmodel/bookmodel.dart';
import 'package:dartz/dartz.dart';

abstract class SearchRepo {
 Future< Either<Failure,List<Bookmodel>>> getSearchBooks({required String search});
}
