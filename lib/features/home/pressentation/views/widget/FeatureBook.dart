import 'package:bookly_app/core/utlis/app_Router.dart';
import 'package:bookly_app/features/home/data/models/bookmodel/bookmodel.dart';
import 'package:bookly_app/features/home/pressentation/mananger/cubit/featurebookcubit_cubit.dart';
import 'package:bookly_app/features/home/pressentation/mananger/cubit/featurebookcubit_state.dart';
import 'package:bookly_app/features/home/pressentation/views/widget/CustomBookImage.dart';
import 'package:bookly_app/features/home/pressentation/views/widget/customErrormessage.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class featuresBook extends StatelessWidget {
  const featuresBook({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturebookCubit, FeaturebookStates>(
      builder: (context, state) {
        if (state is FeatureBookSuccessState) {
          List<Bookmodel> books = state.books;
          return SizedBox(
            height: MediaQuery.of(context).size.height * .25,
            child: ListView.builder(
              padding: EdgeInsets.zero,
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: state.books.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(left: 18),
                  child: GestureDetector(
                    onTap: () {
                      GoRouter.of(
                        context,
                      ).push(AppRouter.kBookdetails, extra: books[index]);
                    },
                    child: CustomBookImage(
                      imageurl:
                          state.books[index].volumeInfo.imageLinks.thumbnail,
                    ),
                  ),
                );
              },
            ),
          );
        } else if (state is FeatureBookLoadingState) {
          return Center(child: CircularProgressIndicator());
        } else if (state is FeatureBookFailureState) {
          return Customerrormessage(eroor: state.meg);
        }
        return SizedBox();
      },
    );
  }
}
