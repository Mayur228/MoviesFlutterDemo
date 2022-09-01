import 'package:movie_flutter_demo/core/util/resource.dart';
import 'package:movie_flutter_demo/features/homescreen/domain/entities/movies_category_entiy.dart';

class GetMovieCategory {
  // final MovieRepository repository;

  Future<Resource<List<MovieCategoryData>>> call() async {

    await Future.delayed(Duration(seconds: 5));

    List<MovieCategoryData> movieList  = [
      const MovieCategoryData(movieCatId: 'm-1', movieCat: 'Bollywood'),
      const MovieCategoryData(movieCatId: 'm-2', movieCat: 'Hollywood'),
      const MovieCategoryData(movieCatId: 'm-3', movieCat: 'Tollywood'),
      const MovieCategoryData(movieCatId: 'm-4', movieCat: 'Kollywood')
    ];


    return Resource.data(movieList);
  }
}
