import 'package:injectable/injectable.dart';
import 'package:movie_flutter_demo/core/util/resource.dart';
import 'package:movie_flutter_demo/features/moviedetails/data/model/details_model.dart';
import 'package:movie_flutter_demo/features/moviedetails/domain/entities/details_entity.dart';

import '../../../../core/util/api_source.dart';

abstract class DetailsDataSource {
  Future<Resource<DetailsEntity>> getMovieDetails(String movieId);
}

@Singleton(as: DetailsDataSource)
class GetMovieDetails implements DetailsDataSource {
  final ApiSource apiSource;

  GetMovieDetails(this.apiSource);

  @override
  Future<Resource<DetailsEntity>> getMovieDetails(String movieId) async {
    final response = await apiSource.init().get("$movieId.json");
    final data = MovieDetails.fromJson(response.data);

    return Future.value(
      Resource.data(
        DetailsEntity(
          movieId: data.id!,
          movieTitle: data.name!,
          moviePoster: data.poster!,
          movieDescription: data.description!,
          movieRating: data.rating!,
        ),
      ),
    );
  }
}
