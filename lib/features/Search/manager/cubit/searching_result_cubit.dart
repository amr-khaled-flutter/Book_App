import 'package:bloc/bloc.dart';
import 'package:bookly_app/features/Search/data/reposity/Search_repo_Implementation.dart';
import 'package:bookly_app/features/Search/manager/cubit/searching_result_state.dart';

class SearchingResultCubit extends Cubit<SearchingResultStates> {
  SearchRepoImplementation searchRepoImplementation;
  SearchingResultCubit(this.searchRepoImplementation)
    : super(SearchingResultInitialState());

  void getBooksREsult({required String search}) async {
    emit(SearchingResultLoadingState());
    var result = await searchRepoImplementation.getSearchBooks(search: search);
    result.fold(
      (fail) {
        emit(SearchingResultFailureState(msgeror: fail.errormsg));
      },
      (books) {
        emit(SearchingResultSuccessState(books: books));
      },
    );
  }
}
