import 'package:bookly_app/features/Search/manager/cubit/searching_result_cubit.dart';
import 'package:bookly_app/features/Search/manager/cubit/searching_result_state.dart';
import 'package:bookly_app/features/home/data/models/bookmodel/bookmodel.dart';
import 'package:bookly_app/features/home/pressentation/views/widget/CustomSellerBook.dart';
import 'package:bookly_app/features/home/pressentation/views/widget/customErrormessage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchingresultlistView extends StatelessWidget {
  const SearchingresultlistView();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchingResultCubit, SearchingResultStates>(
      builder: (context, state) {
        if (state is SearchingResultSuccessState) {
          List<Bookmodel> books = state.books;
          return SliverList(
            delegate: SliverChildBuilderDelegate(childCount: 10, (
              context,
              index,
            ) {
              return Padding(
                padding: EdgeInsets.only(top: 15),
                child: Customsellerbook(bookmodel: books[index]),
              );
            }),
          );
        } else if (state is SearchingResultLoadingState) {
          return SliverToBoxAdapter(
            child: Center(child: CircularProgressIndicator()),
          );
        } else if (state is SearchingResultFailureState) {
          return SliverToBoxAdapter(
            child: Customerrormessage(eroor: state.msgeror),
          );
        }
        return SliverToBoxAdapter(child: SizedBox());
      },
    );
  }
}
