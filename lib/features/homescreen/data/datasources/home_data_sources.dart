import 'package:injectable/injectable.dart';
import 'package:movie_flutter_demo/features/homescreen/data/model/movie_category_model.dart';
import 'package:movie_flutter_demo/features/homescreen/data/model/movie_list_model.dart';

abstract class HomeDataSources {
  Future<List<MovieCategoryDataModel>> getMovieCategory();

  Future<List<MovieListDataModel>> getMovies(String category);
}

@Singleton(as: HomeDataSources)
class GetMovieCategoryData implements HomeDataSources {
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
  Future<List<MovieListDataModel>> getMovies(String category) {
    final List<MovieListDataModel> _movieList = [
      MovieListDataModel(
        movieID: 'm1',
        movieName: 'abc',
        movieDes: 'test',
        movieCat: 'Hollywood',
        moviePoster:
            'https://assets.mubicdn.net/images/notebook/post_images/19893/images-w1400.jpg?1449196747',
        movieRates: 4.5,
      ),
      MovieListDataModel(
        movieID: 'm1',
        movieName: 'abc',
        movieDes: 'test',
        movieCat: 'Bollywood',
        moviePoster:
            'https://assets.mubicdn.net/images/notebook/post_images/19893/images-w1400.jpg?1449196747',
        movieRates: 5,
      ),
      MovieListDataModel(
        movieID: 'm1',
        movieName: 'abc',
        movieDes: 'test',
        movieCat: 'Hollywood',
        moviePoster:
            'https://assets.mubicdn.net/images/notebook/post_images/19893/images-w1400.jpg?1449196747',
        movieRates: 2.5,
      ),
      MovieListDataModel(
        movieID: 'm1',
        movieName: 'abc',
        movieDes: 'test',
        movieCat: 'Hollywood',
        moviePoster:
            'https://assets.mubicdn.net/images/notebook/post_images/19893/images-w1400.jpg?1449196747',
        movieRates: 3.5,
      ),
    ];
    final movieList = _movieList.where((element) => element.movieCat == category).toList();

    return Future.value(movieList);
  }
}
