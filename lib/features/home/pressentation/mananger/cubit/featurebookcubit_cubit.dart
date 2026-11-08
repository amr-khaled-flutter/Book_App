import 'package:bloc/bloc.dart';
import 'package:bookly_app/core/Error/failure.dart';
import 'package:bookly_app/features/home/data/models/bookmodel/roposit/Home_Repo_Impelementation.dart';
import 'package:bookly_app/features/home/pressentation/mananger/cubit/featurebookcubit_state.dart';

class FeaturebookCubit extends Cubit<FeaturebookStates> {
  HomeRepoImpelementation homeRepoImpelementation;
  FeaturebookCubit(this.homeRepoImpelementation) : super(FeatureBookInitial());

  Future<void> getFeatureBook() async {
    emit(FeatureBookLoadingState());
    var result = await homeRepoImpelementation.fetchPythonBooks();
    result.fold(
      (Fail) {
        emit(FeatureBookFailureState(meg: Fail.errormsg));
      },
      (books) {
        emit(FeatureBookSuccessState(books: books));
      },
    );
  }
}
