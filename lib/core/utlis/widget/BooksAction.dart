import 'package:bookly_app/core/utlis/Function/lanchurl.dart';
import 'package:bookly_app/core/utlis/widget/BookBotton.dart';
import 'package:bookly_app/features/home/data/models/bookmodel/bookmodel.dart';
import 'package:flutter/material.dart';

class Booksaction extends StatelessWidget {
  const Booksaction({required this.bookmodel});
  final Bookmodel bookmodel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        children: [
          Expanded(
            child: Bookbotton(
              colortext: Colors.black,
              color: Colors.white,
              text: 'Free',
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16),
                bottomLeft: Radius.circular(16),
              ),
            ),
          ),
          Expanded(
            child: Bookbotton(
              onPressed: () {
                lanch_url(context, bookmodel.volumeInfo.previewLink);
              },
              colortext: Colors.white,
              color: Color(0xffED8165),
              text: gettext(bookmodel),
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(16),
                bottomRight: Radius.circular(16),
              ),
            ),
          ),
        ],
      ),
    );
  }

  String gettext(Bookmodel bookmodel) {
    if (bookmodel.volumeInfo.previewLink == null) {
      return 'Not available';
    }
    return 'Preview';
  }
}
