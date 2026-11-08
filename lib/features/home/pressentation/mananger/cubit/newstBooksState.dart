import 'package:bookly_app/features/home/data/models/bookmodel/bookmodel.dart';
import 'package:flutter/material.dart';

class newstBooksState {}

class BestNewstBooksLoadingState extends newstBooksState {}

class BestNewstBooksSuccessState extends newstBooksState {
  List<Bookmodel> books;
  BestNewstBooksSuccessState({required this.books});
}

class BestnewstBookFailure extends newstBooksState {
  final String msg;
  BestnewstBookFailure({required this.msg});
}

class BestNewsInitial extends newstBooksState {}
