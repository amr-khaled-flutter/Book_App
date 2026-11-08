import 'package:bookly_app/core/utlis/Styles.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Bookrating extends StatelessWidget {
  final MainAxisAlignment mainAxisAlignment;
  final double bookrating;
  final int count;
  const Bookrating({
    super.key,
    this.mainAxisAlignment = MainAxisAlignment.start,
   required this.bookrating,
   required this.count,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment,
      children: [
        FaIcon(FontAwesomeIcons.solidStar, color: Color(0xffFFdd4F), size: 22),
        SizedBox(width: 6.3),
        Text(
           '$bookrating',
          style: Styles.textStyle16,
        ),
        SizedBox(width: 5),
        Opacity(
          opacity: 0.5,
          child: Text(
             '($count)',
            style: Styles.textStyle14.copyWith(fontWeight: FontWeight.w600),
          ),
        ),
      ],
    );
  }
}
