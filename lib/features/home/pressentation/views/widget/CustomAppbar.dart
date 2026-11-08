import 'package:bookly_app/core/utlis/AssetsData.dart';
import 'package:bookly_app/core/utlis/app_Router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class customAppbar extends StatelessWidget {
  const customAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Image(width: 95, height: 95, image: AssetImage(AssetsDate.logo)),
        IconButton(
          onPressed: () {
            GoRouter.of(context).push(AppRouter.ksearching);
          },
          icon: Icon(Icons.search, size: 35, color: Colors.white),
        ),
      ],
    );
  }
}
