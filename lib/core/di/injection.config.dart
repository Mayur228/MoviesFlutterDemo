// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../features/addmovie/data/datasources/local/app_databse.dart' as _i8;
import '../../features/addmovie/data/repository/movie_repository.dart' as _i7;
import '../../features/addmovie/domain/repository/movie_repository.dart' as _i6;
import '../../features/addmovie/domain/usecases/add_movies_usecase.dart' as _i9;
import '../../features/addmovie/domain/usecases/get_movies_usecase.dart'
    as _i13;
import '../../features/addmovie/presentation/bloc/add_movie_bloc.dart' as _i15;
import '../../features/homescreen/data/datasources/home_data_sources.dart'
    as _i3;
import '../../features/homescreen/data/repository/movie_repository_impl.dart'
    as _i5;
import '../../features/homescreen/domain/entities/movies_category_entiy.dart'
    as _i16;
import '../../features/homescreen/domain/repository/movie_repository.dart'
    as _i4;
import '../../features/homescreen/domain/usecases/get_movie_category.dart'
    as _i10;
import '../../features/homescreen/domain/usecases/get_movie_for_category_usecase.dart'
    as _i11;
import '../../features/homescreen/domain/usecases/get_movie_list.dart' as _i12;
import '../../features/homescreen/presentation/bloc/home_bloc.dart'
    as _i14; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.singleton<_i3.HomeDataSources>(_i3.GetMovieCategoryData());
  gh.factory<_i4.MovieRepository>(
      () => _i5.MovieRepositoryImpl(get<_i3.HomeDataSources>()));
  gh.factory<_i6.MovieRepository>(
      () => _i7.MovieRepositoryImpl(get<_i8.AppDatabase>()));
  gh.factory<_i9.AddMoviesUseCase>(
      () => _i9.AddMoviesUseCase(get<_i6.MovieRepository>()));
  gh.factory<_i10.GetMovieCategory>(
      () => _i10.GetMovieCategory(get<_i4.MovieRepository>()));
  gh.factory<_i11.GetMovieForCategoryUseCase>(
      () => _i11.GetMovieForCategoryUseCase(get<_i4.MovieRepository>()));
  gh.factory<_i12.GetMovieList>(
      () => _i12.GetMovieList(get<_i4.MovieRepository>()));
  gh.factory<_i13.GetMoviesUseCase>(
      () => _i13.GetMoviesUseCase(get<_i6.MovieRepository>()));
  gh.factory<_i14.HomeBloc>(() => _i14.HomeBloc(
      category: get<_i10.GetMovieCategory>(),
      movies: get<_i12.GetMovieList>()));
  gh.factory<_i15.AddMovieBloc>(() => _i15.AddMovieBloc(
      categories: get<List<_i16.MovieCategoryData>>(),
      moviesUseCase: get<_i9.AddMoviesUseCase>()));
  return get;
}
