import 'package:bookly_app/features/home/data/models/bookmodel/bookmodel.dart';
import 'package:bookly_app/features/home/pressentation/mananger/cubit/cubit/similler_book_cubit_cubit.dart';
import 'package:bookly_app/features/home/pressentation/mananger/cubit/cubit/similler_book_cubit_state.dart';
import 'package:bookly_app/features/home/pressentation/views/widget/CustomBookImage.dart';
import 'package:bookly_app/features/home/pressentation/views/widget/customErrormessage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SimellerBooksListView extends StatelessWidget {
  const SimellerBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SimillerBookCubitCubit, SimillerBookCubitStates>(
      builder: (context, state) {
        if (state is SimillerBookSuccessState) {
          List<Bookmodel> books = state.books;
          return SizedBox(
            height: MediaQuery.of(context).size.height * .16,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: books.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: CustomBookImage(
                    imageurl: books[index].volumeInfo.imageLinks.thumbnail,
                        
                  ),
                );
              },
            ),
          );
        } else if (state is SimillerBookLoadingState) {
          return Center(child: CircularProgressIndicator());
        } else if (state is SimillerBookFailureState) {
          return Customerrormessage(eroor: state.msg);
        }
        return SizedBox();
      },
    );
  }
}
