import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomAppBarBookdetails extends StatelessWidget {

  const CustomAppBarBookdetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          icon: Icon(Icons.close, size: 30, color: Colors.white),
          onPressed: () {
            GoRouter.of(context).pop();
          },
        ),
        IconButton(
          icon: Icon(
            Icons.shopping_cart_outlined,
            size: 30,
            color: Colors.white,
          ),
          onPressed: () {},
        ),
      ],
    );
  }
}
