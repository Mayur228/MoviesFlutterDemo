import 'package:injectable/injectable.dart';
import 'package:movie_flutter_demo/core/util/resource.dart';
import 'package:movie_flutter_demo/features/homescreen/data/datasources/home_data_sources.dart';
import 'package:movie_flutter_demo/features/homescreen/data/model/movie_list_model.dart';
import 'package:movie_flutter_demo/features/homescreen/domain/entities/movies_category_entiy.dart';
import 'package:movie_flutter_demo/features/homescreen/domain/entities/movies_list_entiy.dart';
import 'package:movie_flutter_demo/features/homescreen/domain/repository/movie_repository.dart';

@Injectable(as: MovieRepository)
class MovieRepositoryImpl implements MovieRepository {
  final HomeDataSources homeDataSources;

  MovieRepositoryImpl(this.homeDataSources);

  @override
  Future<Resource<List<MovieCategoryData>>> getMovieCategory() async {
    final movieCategoryData = await homeDataSources.getMovieCategory();

    final movieCatList = movieCategoryData
        .map(
          (e) => MovieCategoryData(
            movieCatId: e.movieCatId,
            movieCat: e.movieCat,
          ),
        )
        .toList();
    return Future.value(Resource.data(movieCatList));
  }

  @override
  Future<Resource<List<Movie>>> getMovieForCategory(
      String categoryId) async {
    final movieListData = await homeDataSources.getMovies(categoryId);

    return Future.value(Resource.data(movieListData));
  }
}
