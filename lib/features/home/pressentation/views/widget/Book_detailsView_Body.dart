import 'package:bookly_app/features/home/data/models/bookmodel/bookmodel.dart';
import 'package:bookly_app/features/home/pressentation/views/widget/BookDetailsSEction.dart';
import 'package:bookly_app/features/home/pressentation/views/widget/CustomAppBarBookdetails.dart';
import 'package:bookly_app/features/home/pressentation/views/widget/SimellerBooksSection.dart';
import 'package:flutter/material.dart';

class BookDetailsviewBody extends StatelessWidget {
  const BookDetailsviewBody({required this.bookmodel});
  final Bookmodel bookmodel;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              children: [
                CustomAppBarBookdetails(),
                SizedBox(height: 50),
                BookDetailsSection(
                  bookmodel:bookmodel ,
                ),
                SizedBox(height: 37),
                Expanded(child: SizedBox(height: 30)),
                SimellerBooksSection(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
