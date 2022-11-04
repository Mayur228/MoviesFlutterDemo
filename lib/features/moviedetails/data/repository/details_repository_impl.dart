import 'package:injectable/injectable.dart';
import 'package:movie_flutter_demo/core/util/resource.dart';
import 'package:movie_flutter_demo/features/moviedetails/data/datasources/details_data_source.dart';
import 'package:movie_flutter_demo/features/moviedetails/domain/entities/details_entity.dart';
import 'package:movie_flutter_demo/features/moviedetails/domain/repository/details_repository.dart';

@Injectable(as: MovieDetailsRepository)
class DetailsRepository implements MovieDetailsRepository {
  final DetailsDataSource source;

  DetailsRepository(this.source);
  @override
  Future<Resource<DetailsEntity>> getMovieDetails(String movieId) {
    return source.getMovieDetails(movieId);
  }
}