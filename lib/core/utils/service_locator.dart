import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:ican_to/core/services/api_services.dart';
import 'package:ican_to/features/Authentication/data/Models/repos/auth_repo_impl.dart';
<<<<<<< HEAD
=======
import 'package:ican_to/features/Home/data/repos/home_repo_impl.dart';
>>>>>>> f0e6fff (Update project with new version when modify repostry redmi)

final getIt = GetIt.instance;
void setupServicLocator() {
  getIt.registerSingleton<AuthRepoImpl>(
    AuthRepoImpl(
      ApiServices(
        dio: Dio(),
      ),
    ),
  );
<<<<<<< HEAD
=======
  getIt.registerSingleton<HomeRepoImpl>(
    HomeRepoImpl(
      apiServices: ApiServices(dio: Dio()),
    ),
  );
>>>>>>> f0e6fff (Update project with new version when modify repostry redmi)
}
