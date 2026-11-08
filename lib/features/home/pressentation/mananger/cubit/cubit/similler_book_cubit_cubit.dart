import 'package:bloc/bloc.dart';
import 'package:bookly_app/features/home/data/models/bookmodel/roposit/Home_Repo_Impelementation.dart';
import 'package:bookly_app/features/home/pressentation/mananger/cubit/cubit/similler_book_cubit_state.dart';

class SimillerBookCubitCubit extends Cubit<SimillerBookCubitStates> {
  HomeRepoImpelementation homeRepoImpelementation;
  SimillerBookCubitCubit(this.homeRepoImpelementation)
    : super(SimillerBookInitial());

  void getSimillerBooks({required String catagory}) async {
    emit(SimillerBookLoadingState());
    var result = await homeRepoImpelementation.fetchSimellerBooks(
      catagory: catagory,
    );
    result.fold(
      (fail) {
        emit(SimillerBookFailureState(msg: fail.errormsg));
      },
      (books) {
        emit(SimillerBookSuccessState(books: books));
      },
    );
  }
}
