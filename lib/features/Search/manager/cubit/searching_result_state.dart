import 'package:bookly_app/features/home/data/models/bookmodel/bookmodel.dart';

abstract class SearchingResultStates {}

class SearchingResultLoadingState extends SearchingResultStates {}

class SearchingResultFailureState extends SearchingResultStates {
  final String msgeror;

  SearchingResultFailureState({required this.msgeror});
}

class SearchingResultSuccessState extends SearchingResultStates {
  final List<Bookmodel> books;

  SearchingResultSuccessState({required this.books});
}

class SearchingResultInitialState extends SearchingResultStates {}
