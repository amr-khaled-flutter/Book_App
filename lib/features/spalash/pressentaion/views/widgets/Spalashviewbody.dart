import 'package:bookly_app/core/utlis/AssetsData.dart';
import 'package:bookly_app/core/utlis/app_Router.dart';
import 'package:bookly_app/features/home/pressentation/mananger/cubit/featurebookcubit_cubit.dart';
import 'package:bookly_app/features/home/pressentation/views/widget/FeatureBook.dart';
import 'package:bookly_app/features/spalash/pressentaion/views/widgets/SlidingText.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class Spalashviewbody extends StatefulWidget {
  const Spalashviewbody({super.key});

  @override
  State<Spalashviewbody> createState() => _SpalashviewbodyState();
}

class _SpalashviewbodyState extends State<Spalashviewbody>
    with TickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> slidinganimate;
  @override
  void initState() {
    super.initState();
    initslideanimation();
    Navigator_to_Home();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image(image: AssetImage(AssetsDate.logo)),
        slidingtext(slidinganimate: slidinganimate),
      ],
    );
  }

  void initslideanimation() {
    animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );
    slidinganimate = Tween<Offset>(
      begin: Offset(0, 4),
      end: Offset(0, 0),
    ).animate(animationController);
    animationController.forward();
  }

  void Navigator_to_Home() {
    Future.delayed(const Duration(seconds: 2), () {
      // Get.to(() => Homeview(), transition: Transition.fade, duration: ktransionduration);
      GoRouter.of(context).push(AppRouter.khomeview);
    });
  }
}
