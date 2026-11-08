import 'package:bookly_app/const.dart';
import 'package:bookly_app/core/utlis/Styles.dart';
import 'package:bookly_app/core/utlis/app_Router.dart';
import 'package:bookly_app/features/home/data/models/bookmodel/bookmodel.dart';
import 'package:bookly_app/features/home/pressentation/views/widget/BookRating.dart';
import 'package:bookly_app/features/home/pressentation/views/widget/CustomBookImage.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Customsellerbook extends StatelessWidget {
 final Bookmodel bookmodel;
  const Customsellerbook({required this.bookmodel});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(AppRouter.kBookdetails,extra: bookmodel);
      },
      child: SizedBox(
        height: 130,
        child: Row(
          children: [
            CustomBookImage(imageurl: bookmodel.volumeInfo.imageLinks.thumbnail),
            SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .5,
                    child: Text(
                      maxLines: 2,
                      overflow: TextOverflow.clip,
                      bookmodel.volumeInfo.title!,
                      style: Styles.textStyle20.copyWith(
                        fontFamily: kGtSectraFine,
                      ),
                    ),
                  ),
                  SizedBox(height: 3),
                  Text(bookmodel.volumeInfo.authors![0], style: Styles.textStyle14),
                  SizedBox(height: 3),
                  Row(
                    children: [
                      Text(
                        'Free',
                        style: Styles.textStyle20.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Spacer(),
                      Bookrating(
                       bookrating: bookmodel.volumeInfo.rating ?? 0,
                       count: bookmodel.volumeInfo.count ?? 0,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
