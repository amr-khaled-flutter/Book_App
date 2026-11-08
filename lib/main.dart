import 'package:bookly_app/const.dart';
import 'package:bookly_app/core/utlis/Serveiceslocator.dart';
import 'package:bookly_app/core/utlis/app_Router.dart';
import 'package:bookly_app/features/home/data/models/bookmodel/roposit/Home_Repo_Impelementation.dart';
import 'package:bookly_app/features/home/pressentation/mananger/cubit/newstBooksCubit.dart';
import 'package:bookly_app/features/home/pressentation/mananger/cubit/featurebookcubit_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  setup();
  runApp(Bookly_app());
}

class Bookly_app extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              FeaturebookCubit(getit.get<HomeRepoImpelementation>())
                ..getFeatureBook(),
        ),
        BlocProvider(
          create: (context) =>
              newstBooksCubit(getit.get<HomeRepoImpelementation>())
                ..getbestnews(),
        ),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: AppRouter.router,
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: kprimarycolor,
          textTheme: GoogleFonts.montserratTextTheme(
            ThemeData.dark().textTheme,
          ),
        ),
      ),
    );
  }
}
