import 'package:bookly_app/features/home/data/models/bookmodel/bookmodel.dart';

class SimillerBookCubitStates {}

class SimillerBookLoadingState extends SimillerBookCubitStates {}

class SimillerBookSuccessState extends SimillerBookCubitStates {
  List<Bookmodel> books;
  SimillerBookSuccessState({required this.books});
}

class SimillerBookFailureState extends SimillerBookCubitStates {
  final String msg;
  SimillerBookFailureState({required this.msg});
}

class SimillerBookInitial extends SimillerBookCubitStates {}
