import 'package:movie_flutter_demo/features/homescreen/domain/entities/movies_list_entiy.dart';

class GetMovieList {
  GetMovieList();

  List<MovieListData> getData() {
    List<MovieListData> movieList;

    movieList = [
      MovieListData('m1', 'abc', 'test','https://assets.mubicdn.net/images/notebook/post_images/19893/images-w1400.jpg?1449196747',4.5),
      MovieListData('m1', 'abc', 'test','https://assets.mubicdn.net/images/notebook/post_images/19893/images-w1400.jpg?1449196747',5),
      MovieListData('m1', 'abc', 'test','https://assets.mubicdn.net/images/notebook/post_images/19893/images-w1400.jpg?1449196747',2.5),
      MovieListData('m1', 'abc', 'test','https://assets.mubicdn.net/images/notebook/post_images/19893/images-w1400.jpg?1449196747',3.5),
    ];
    return movieList;
  }
}
