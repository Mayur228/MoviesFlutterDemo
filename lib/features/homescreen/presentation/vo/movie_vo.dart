import 'package:freezed_annotation/freezed_annotation.dart';
part 'movie_vo.freezed.dart';

@freezed
class MovieVo with _$MovieVo {

  const factory MovieVo({required List<Movie> list})= _MovieVo;
}

@freezed
class Movie with _$Movie {
  const factory Movie({required final String id,
    required final String poster,
    required final String name,
    required final String des,
    required final double rating,
    required final bool isLike})= _Movie;
}