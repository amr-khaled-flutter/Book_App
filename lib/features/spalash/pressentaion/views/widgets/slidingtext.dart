import 'package:flutter/material.dart';

class slidingtext extends StatelessWidget {
  const slidingtext({super.key, required this.slidinganimate});

  final Animation<Offset> slidinganimate;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: slidinganimate,
      builder: (context, _) {
        return SlideTransition(
          position: slidinganimate,
          child: Text(
            'Read Free Books',
            style: TextStyle(fontSize: 17),
            textAlign: TextAlign.center,
          ),
        );
      },
    );
  }
}
