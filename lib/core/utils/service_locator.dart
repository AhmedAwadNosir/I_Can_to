import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:ican_to/core/services/api_services.dart';
import 'package:ican_to/features/Authentication/data/Models/repos/auth_repo_impl.dart';
import 'package:ican_to/features/Home/data/repos/home_repo_impl.dart';

final getIt = GetIt.instance;
void setupServicLocator() {
  getIt.registerSingleton<AuthRepoImpl>(
    AuthRepoImpl(
      ApiServices(
        dio: Dio(),
      ),
    ),
  );
  getIt.registerSingleton<HomeRepoImpl>(
    HomeRepoImpl(
      apiServices: ApiServices(dio: Dio()),
    ),
  );
}
