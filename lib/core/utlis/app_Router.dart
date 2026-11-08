import 'package:bookly_app/core/utlis/Serveiceslocator.dart';
import 'package:bookly_app/features/Search/data/reposity/Search_repo_Implementation.dart';
import 'package:bookly_app/features/Search/manager/cubit/searching_result_cubit.dart';
import 'package:bookly_app/features/Search/presentation/Views/SearchView.dart';
import 'package:bookly_app/features/home/data/models/bookmodel/bookmodel.dart';
import 'package:bookly_app/features/home/data/models/bookmodel/roposit/Home_Repo_Impelementation.dart';
import 'package:bookly_app/features/home/pressentation/mananger/cubit/cubit/similler_book_cubit_cubit.dart';
import 'package:bookly_app/features/home/pressentation/views/Book_detailsView.dart';
import 'package:bookly_app/features/home/pressentation/views/HomeView.dart';
import 'package:bookly_app/features/spalash/pressentaion/views/Splashview.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static String khomeview = '/homeview';
  static String kBookdetails = '/Bookdetails';
  static String ksearching = '/ksearch';

  static final router = GoRouter(
    routes: [
      GoRoute(path: '/', builder: (context, state) => const Splashview()),
      GoRoute(path: khomeview, builder: (context, state) => const Homeview()),
      GoRoute(
        path: kBookdetails,
        builder: (context, state) => BlocProvider(
          create: (context) =>
              SimillerBookCubitCubit(getit.get<HomeRepoImpelementation>()),
          child: BookDetailsview(bookmodel: state.extra as Bookmodel),
        ),
      ),
      GoRoute(
        path: ksearching,
        builder: (context, state) => BlocProvider(
          create: (context) => SearchingResultCubit(
            getit.get<SearchRepoImplementation>(),
          ),
          child: const Searchview(),
        ),
      ),
    ],
  );
}
