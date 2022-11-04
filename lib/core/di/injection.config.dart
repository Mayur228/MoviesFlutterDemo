// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../features/addmovie/data/repository/movie_repository_impl.dart'
    as _i11;
import '../../features/addmovie/domain/repository/movie_repository.dart'
    as _i10;
import '../../features/homescreen/data/datasources/home_data_sources.dart'
    as _i5;
import '../../features/homescreen/data/repository/movie_repository_impl.dart'
    as _i9;
import '../../features/homescreen/domain/repository/movie_repository.dart'
    as _i8;
import '../../features/homescreen/domain/usecases/get_movie_category.dart'
    as _i12;
import '../../features/homescreen/domain/usecases/get_movie_for_category_usecase.dart'
    as _i14;
import '../../features/homescreen/domain/usecases/get_movie_list.dart' as _i15;
import '../../features/homescreen/presentation/bloc/home_bloc.dart' as _i16;
import '../../features/moviedetails/data/datasources/details_data_source.dart'
    as _i4;
import '../../features/moviedetails/data/repository/details_repository_impl.dart'
    as _i7;
import '../../features/moviedetails/domain/repository/details_repository.dart'
    as _i6;
import '../../features/moviedetails/domain/usecase/get_movie_details_usecase.dart'
    as _i13;
import '../../features/moviedetails/presentation/bloc/details_bloc.dart'
    as _i17;
import '../util/api_source.dart' as _i3; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.factory<_i3.ApiSource>(() => _i3.ApiSource());
  gh.singleton<_i4.DetailsDataSource>(
      _i4.GetMovieDetails(get<_i3.ApiSource>()));
  gh.singleton<_i5.HomeDataSources>(
      _i5.GetMovieCategoryData(get<_i3.ApiSource>()));
  gh.factory<_i6.MovieDetailsRepository>(
      () => _i7.DetailsRepository(get<_i4.DetailsDataSource>()));
  gh.factory<_i8.MovieRepository>(
      () => _i9.MovieRepositoryImpl(get<_i5.HomeDataSources>()));
  gh.factory<_i10.MovieRepository>(() => _i11.MovieRepositoryImpl());
  gh.factory<_i12.GetMovieCategory>(
      () => _i12.GetMovieCategory(get<_i8.MovieRepository>()));
  gh.factory<_i13.GetMovieDetailsUseCase>(
      () => _i13.GetMovieDetailsUseCase(get<_i6.MovieDetailsRepository>()));
  gh.factory<_i14.GetMovieForCategoryUseCase>(
      () => _i14.GetMovieForCategoryUseCase(get<_i8.MovieRepository>()));
  gh.factory<_i15.GetMovieList>(
      () => _i15.GetMovieList(get<_i8.MovieRepository>()));
  gh.factory<_i16.HomeBloc>(() => _i16.HomeBloc(
      category: get<_i12.GetMovieCategory>(),
      movies: get<_i15.GetMovieList>()));
  gh.factory<_i17.DetailsBloc>(
      () => _i17.DetailsBloc(getDetails: get<_i13.GetMovieDetailsUseCase>()));
  return get;
}
