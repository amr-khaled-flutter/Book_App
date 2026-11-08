import 'package:bookly_app/core/utlis/Styles.dart';
import 'package:bookly_app/core/utlis/widget/BooksAction.dart';
import 'package:bookly_app/features/home/data/models/bookmodel/bookmodel.dart';
import 'package:bookly_app/features/home/pressentation/views/widget/BookRating.dart';
import 'package:bookly_app/features/home/pressentation/views/widget/CustomBookImage.dart';
import 'package:flutter/material.dart';

class BookDetailsSection extends StatelessWidget {
  final Bookmodel bookmodel;
  const BookDetailsSection({required this.bookmodel});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * .3,
          child: CustomBookImage(
            imageurl: bookmodel.volumeInfo.imageLinks.thumbnail,
          ),
        ),
        SizedBox(height: 20,),
        Text(
          textAlign: TextAlign.center,
          bookmodel.volumeInfo.title!,
          style: Styles.textStyle30.copyWith(fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 6),
        Opacity(
          opacity: .7,
          child: Text(
             bookmodel.volumeInfo.authors![0],
            style: Styles.textStyle18.copyWith(
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        SizedBox(height: 18),
        Bookrating(
          mainAxisAlignment: MainAxisAlignment.center,
          count: bookmodel.volumeInfo.count ?? 0,
          bookrating: bookmodel.volumeInfo.rating ?? 0.0,
        ),
        SizedBox(height: 50),
        Booksaction(
          bookmodel: bookmodel,
        ),
      ],
    );
  }
}
