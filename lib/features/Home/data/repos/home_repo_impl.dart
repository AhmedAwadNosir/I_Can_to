import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ican_to/core/services/api_services.dart';
import 'package:ican_to/core/utils/Errors/failure.dart';
import 'package:ican_to/features/Home/data/repos/home_repo.dart';

class HomeRepoImpl implements HomeRepo {
  final ApiServices apiServices;

  HomeRepoImpl({required this.apiServices});

  @override
  Future<Either<Failure, dynamic>> translateSignLanguage(
      {required String imagePath}) async {
    try {
      FormData formData = FormData.fromMap({
        "frame": MultipartFile.fromFile(imagePath,
            filename: imagePath.split('/').last)
      });

      var response = await apiServices.post(
        endPoint: "/upload",
        body: formData,
      );

      return right(response);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }
}
