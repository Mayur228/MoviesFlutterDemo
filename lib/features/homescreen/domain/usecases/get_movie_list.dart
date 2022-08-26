import 'package:movie_flutter_demo/features/homescreen/domain/entities/movies_list_entiy.dart';

class GetMovieList {
  GetMovieList();

  List<MovieListData> getData() {
    List<MovieListData> movieList;

    movieList = [
      MovieListData('m1', 'abc', 'test'),
      MovieListData('m1', 'abc', 'test'),
      MovieListData('m1', 'abc', 'test'),
      MovieListData('m1', 'abc', 'test'),
    ];
    return movieList;
  }
}
