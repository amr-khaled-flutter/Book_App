import 'package:bookly_app/features/home/data/models/bookmodel/bookmodel.dart';
import 'package:bookly_app/features/home/pressentation/mananger/cubit/newstBooksCubit.dart';
import 'package:bookly_app/features/home/pressentation/mananger/cubit/newstBooksState.dart';
import 'package:bookly_app/features/home/pressentation/views/widget/CustomSellerBook.dart';
import 'package:bookly_app/features/home/pressentation/views/widget/customErrormessage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class newstSellerBooks extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<newstBooksCubit, newstBooksState>(
      builder: (context, state) {
        if (state is BestNewstBooksLoadingState) {
          return SliverToBoxAdapter(
            child: Center(child: CircularProgressIndicator()),
          );
        } else if (state is BestnewstBookFailure) {
          return SliverToBoxAdapter(
            child: Customerrormessage(eroor: state.msg),
          );
        } else if (state is BestNewstBooksSuccessState) {
          List<Bookmodel> books = state.books;
          return SliverList(
            delegate: SliverChildBuilderDelegate(
              childCount: state.books.length,
              (context, index) {
                return Padding(
                  padding: EdgeInsets.only(top: 8),
                  child: Customsellerbook(bookmodel: books[index]),
                );
              },
            ),
          );
        }
        return SizedBox();
      },
    );
  }
}
