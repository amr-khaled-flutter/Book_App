import 'package:bookly_app/core/utlis/ApiSevices.dart';
import 'package:bookly_app/features/Search/data/reposity/Search_repo_Implementation.dart';
import 'package:bookly_app/features/home/data/models/bookmodel/roposit/Home_Repo_Impelementation.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getit = GetIt.instance;

void setup() {
  getit.registerSingleton<Apisevices>(Apisevices(Dio()));
  getit.registerSingleton<HomeRepoImpelementation>(
    HomeRepoImpelementation(getit.get<Apisevices>()),
  );
  getit.registerSingleton<SearchRepoImplementation>(
    SearchRepoImplementation(Apisevices(Dio())),
  );
}
