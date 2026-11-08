import 'package:bookly_app/features/home/data/models/bookmodel/bookmodel.dart';

class FeaturebookStates {}

class FeatureBookSuccessState extends FeaturebookStates {
  List<Bookmodel> books;
  FeatureBookSuccessState({required this.books});
}

class FeatureBookFailureState extends FeaturebookStates {
  final String meg;
  FeatureBookFailureState({required this.meg});
}

class FeatureBookLoadingState extends FeaturebookStates {}

class FeatureBookInitial extends FeaturebookStates {}
