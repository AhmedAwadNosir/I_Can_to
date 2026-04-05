import 'package:dartz/dartz.dart';
import 'package:ican_to/core/utils/Errors/failure.dart';

abstract class HomeRepo {
  Future<Either<Failure, dynamic>> translateSignLanguage(
      {required String imagePath});
}
