import 'package:bookly_app/core/utlis/Styles.dart';
import 'package:bookly_app/features/Search/manager/cubit/searching_result_cubit.dart';
import 'package:bookly_app/features/Search/presentation/widget/customtextfeild.dart';
import 'package:bookly_app/features/Search/presentation/widget/searchingbookslistView.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                customtextfeild(
                  onSubmitted: (data) {
                    BlocProvider.of<SearchingResultCubit>(
                      context,
                    ).getBooksREsult(search: data);
                  },
                ),
                SizedBox(height: 16),
                Text('Result', style: Styles.textStyle18),
                SizedBox(height: 20),
              ],
            ),
          ),
          SearchingresultlistView(),
        ],
      ),
    );
  }
}
