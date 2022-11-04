import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:movie_flutter_demo/features/homescreen/data/model/movie_category_model.dart';
import 'package:movie_flutter_demo/features/homescreen/data/model/movie_list_model.dart';

import '../../../../core/util/api_source.dart';

abstract class HomeDataSources {
  Future<List<MovieCategoryDataModel>> getMovieCategory();

  Future<List<Movie>> getMovies(String category);
}

@Singleton(as: HomeDataSources)
class GetMovieCategoryData implements HomeDataSources {
  final ApiSource apiSource;

  GetMovieCategoryData(this.apiSource);

  @override
  Future<List<MovieCategoryDataModel>> getMovieCategory() {
    List<MovieCategoryDataModel> movieList = [
      MovieCategoryDataModel(movieCatId: 'm-1', movieCat: 'Bollywood'),
      MovieCategoryDataModel(movieCatId: 'm-2', movieCat: 'Hollywood'),
      MovieCategoryDataModel(movieCatId: 'm-3', movieCat: 'Tollywood'),
      MovieCategoryDataModel(movieCatId: 'm-4', movieCat: 'Kollywood')
    ];
    return Future.value(movieList);
  }

  @override
  Future<List<Movie>> getMovies(String category) async {
    final response = await apiSource.init().get("list.json");
    final data = MovieListDataModel.fromJson(response.data);
    final list = data.movies?.map(
      (e) => Movie(
        id: e?.id,
        name: e?.name,
        description: e?.description,
        rating: e?.rating,
        poster: e?.poster,
        director: e?.director
      ),
    ).toList();

    return Future.value(list);
  }
}
