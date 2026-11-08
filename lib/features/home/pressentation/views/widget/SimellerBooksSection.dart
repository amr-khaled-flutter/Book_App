import 'package:bookly_app/core/utlis/Styles.dart';
import 'package:bookly_app/features/home/pressentation/views/widget/SimellerBooksListView.dart';
import 'package:flutter/material.dart';

class SimellerBooksSection extends StatelessWidget {
  const SimellerBooksSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'You can also like',
          style: Styles.textStyle14.copyWith(fontWeight: FontWeight.w600),
        ),
        SizedBox(height: 16),
        SimellerBooksListView(),
      ],
    );
  }
}
