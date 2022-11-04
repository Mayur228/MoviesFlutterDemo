import 'package:injectable/injectable.dart';
import 'package:movie_flutter_demo/core/util/resource.dart';
import 'package:movie_flutter_demo/features/moviedetails/domain/entities/details_entity.dart';

abstract class MovieDetailsRepository {
  Future<Resource<DetailsEntity>>getMovieDetails(String movieId);
}