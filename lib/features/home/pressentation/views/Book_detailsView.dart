import 'package:bookly_app/features/home/data/models/bookmodel/bookmodel.dart';
import 'package:bookly_app/features/home/pressentation/mananger/cubit/cubit/similler_book_cubit_cubit.dart';
import 'package:bookly_app/features/home/pressentation/views/widget/Book_detailsView_Body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookDetailsview extends StatefulWidget {
  final Bookmodel bookmodel;
  const BookDetailsview({required this.bookmodel});

  @override
  State<BookDetailsview> createState() => _BookDetailsviewState();
}

class _BookDetailsviewState extends State<BookDetailsview> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<SimillerBookCubitCubit>(
      context,
    ).getSimillerBooks(catagory: widget.bookmodel.volumeInfo.categories![0]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: BookDetailsviewBody(bookmodel: widget.bookmodel)),
    );
  }
}
