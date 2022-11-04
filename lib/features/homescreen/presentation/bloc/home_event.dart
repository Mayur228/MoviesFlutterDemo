import 'package:movie_flutter_demo/features/homescreen/domain/entities/movies_category_entiy.dart';
import 'package:movie_flutter_demo/features/homescreen/domain/entities/movies_list_entiy.dart';

abstract class HomeEvents{

}

class LoadInitialDataEvent extends HomeEvents {

}

class GetCategory extends HomeEvents {
  final List<MovieCategoryData> movieCat;

  GetCategory(this.movieCat);
}

class GetMovies extends HomeEvents {
  final List<MovieListData> movieData;

  GetMovies(this.movieData);
}

class GetMoviesForCategoryEvent extends HomeEvents {
  final String catName;

  GetMoviesForCategoryEvent(this.catName);
}

class RedirectToDetails extends HomeEvents {
  final String movieId;
  final bool isLike;
  RedirectToDetails(this.movieId,this.isLike);
}

class LikeEvent extends HomeEvents {
  final String movieId;

  LikeEvent(this.movieId);
}

