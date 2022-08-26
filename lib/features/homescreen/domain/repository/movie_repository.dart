import 'package:dartz/dartz.dart';
import 'package:movie_flutter_demo/core/error/failures.dart';
import 'package:movie_flutter_demo/features/homescreen/domain/entities/movies_category_entiy.dart';

abstract class MovieRepository {
  Future<Either<Failure, MovieCategoryData>> getMovieCategory();
}
