import 'package:bloc/bloc.dart';
import 'package:bookly_app/features/home/data/models/bookmodel/roposit/Home_Repo_Impelementation.dart';
import 'package:bookly_app/features/home/pressentation/mananger/cubit/newstBooksState.dart';

class newstBooksCubit extends Cubit<newstBooksState> {
  newstBooksCubit(this.homeRepoImpelementation) : super(BestNewsInitial());
  HomeRepoImpelementation homeRepoImpelementation;

  Future<void> getbestnews() async {
    emit(BestNewstBooksLoadingState());
    var result = await homeRepoImpelementation.fetchNewsetBooks();
    result.fold(
      (fail) {
        emit(BestnewstBookFailure(msg: fail.errormsg));
      },
      (books) {
        emit(BestNewstBooksSuccessState(books: books));
      },
    );
  }
}
