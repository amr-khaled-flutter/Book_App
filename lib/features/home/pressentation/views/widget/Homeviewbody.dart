import 'package:bookly_app/core/utlis/Styles.dart';
import 'package:bookly_app/features/home/pressentation/views/widget/CustomAppbar.dart';
import 'package:bookly_app/features/home/pressentation/views/widget/FeatureBook.dart';
import 'package:bookly_app/features/home/pressentation/views/widget/ListofSellerBook.dart';
import 'package:flutter/material.dart';

class Homeviewbody extends StatelessWidget {
  const Homeviewbody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                customAppbar(),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .25,
                  child: featuresBook(),
                ),
                SizedBox(height: 20),
                Text('Newst Books', style: Styles.textStyle18),
                SizedBox(height: 20),
              ],
            ),
          ),
           newstSellerBooks(),
        ],
      ),
    );
  }
}
