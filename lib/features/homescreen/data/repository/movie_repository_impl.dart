import 'package:movie_flutter_demo/core/error/failures.dart';
import 'package:movie_flutter_demo/core/util/resource.dart';
import 'package:movie_flutter_demo/features/homescreen/domain/entities/movies_category_entiy.dart';
import 'package:movie_flutter_demo/features/homescreen/domain/entities/movies_list_entiy.dart';
import 'package:movie_flutter_demo/features/homescreen/domain/repository/movie_repository.dart';

class MovieRepositoryImpl implements MovieRepository {
  final List<MovieListData> _movieList = [
    MovieListData(
        'm1',
        'abc',
        'test',
        'Hollywood',
        'https://assets.mubicdn.net/images/notebook/post_images/19893/images-w1400.jpg?1449196747',
        4.5),
    MovieListData(
        'm1',
        'abc',
        'test',
        'Bollywood',
        'https://assets.mubicdn.net/images/notebook/post_images/19893/images-w1400.jpg?1449196747',
        5),
    MovieListData(
        'm1',
        'abc',
        'test',
        'Hollywood',
        'https://assets.mubicdn.net/images/notebook/post_images/19893/images-w1400.jpg?1449196747',
        2.5),
    MovieListData(
        'm1',
        'abc',
        'test',
        'Hollywood',
        'https://assets.mubicdn.net/images/notebook/post_images/19893/images-w1400.jpg?1449196747',
        3.5),
  ];

  @override
  Future<Resource<List<MovieListData>>> getMovieForCategory(String categoryId) {
    return Future.value(
      Resource.data(
        _movieList.where((element) => element.movieCat == categoryId).toList(),
      ),
    );
  }
}
