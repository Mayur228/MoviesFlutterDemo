// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../features/addmovie/data/repository/movie_repository.dart' as _i7;
import '../../features/addmovie/domain/repository/movie_repository.dart' as _i6;
import '../../features/homescreen/data/datasources/home_data_sources.dart'
    as _i3;
import '../../features/homescreen/data/repository/movie_repository_impl.dart'
    as _i5;
import '../../features/homescreen/domain/repository/movie_repository.dart'
    as _i4;
import '../../features/homescreen/domain/usecases/get_movie_category.dart'
    as _i8;
import '../../features/homescreen/domain/usecases/get_movie_for_category_usecase.dart'
    as _i9;
import '../../features/homescreen/domain/usecases/get_movie_list.dart' as _i10;
import '../../features/homescreen/presentation/bloc/home_bloc.dart'
    as _i11; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.singleton<_i3.HomeDataSources>(_i3.GetMovieCategoryData());
  gh.factory<_i4.MovieRepository>(
      () => _i5.MovieRepositoryImpl(get<_i3.HomeDataSources>()));
  gh.factory<_i6.MovieRepository>(() => _i7.MovieRepositoryImpl());
  gh.factory<_i8.GetMovieCategory>(
      () => _i8.GetMovieCategory(get<_i4.MovieRepository>()));
  gh.factory<_i9.GetMovieForCategoryUseCase>(
      () => _i9.GetMovieForCategoryUseCase(get<_i4.MovieRepository>()));
  gh.factory<_i10.GetMovieList>(
      () => _i10.GetMovieList(get<_i4.MovieRepository>()));
  gh.factory<_i11.HomeBloc>(() => _i11.HomeBloc(
      category: get<_i8.GetMovieCategory>(), movies: get<_i10.GetMovieList>()));
  return get;
}
