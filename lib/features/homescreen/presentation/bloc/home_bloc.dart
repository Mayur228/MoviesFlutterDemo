import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_flutter_demo/core/util/resource.dart';
import 'package:movie_flutter_demo/features/homescreen/domain/entities/movies_category_entiy.dart';
import 'package:movie_flutter_demo/features/homescreen/domain/entities/movies_list_entiy.dart';

import '../../domain/usecases/get_movie_category.dart';
import '../../domain/usecases/get_movie_list.dart';
import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvents, HomeState> {
  final GetMovieCategory getMovieCategory;
  final GetMovieList getMovieList;

  HomeBloc({
    required GetMovieCategory category,
    required GetMovieList movies,
  })  : getMovieCategory = category,
        getMovieList = movies,
        super(Pending()) {
    on<LoadInitialDataEvent>(
      (event, emit) async {
        final Resource<List<MovieCategoryData>> movieCategoryListResource =
            await getMovieCategory();

        final result = movieCategoryListResource.when(
          data: (data) {
            return data;
          },
          error: (error) {
            return null;
          },
          pending: () {
            return null;
          },
        );

        if (result == null) {
          emit(ErrorState());
          return;
        }

        List<MovieCategoryData> categories = result;

        if (categories.isEmpty) {
          emit(ErrorState());
          return;
        }

        emit(LoadedState(
          categories: categories,
          movies: Resource.pending(),
        ));

        final firstCategory = categories.first;

        final movieListResource = await getMovieList(firstCategory.movieCat);

        if (movieListResource.error != null) {
          emit(ErrorState());
        }

        emit(LoadedState(
          categories: categories,
          movies: movieListResource,
        ));
      },
    );

    on<GetMoviesForCategoryEvent>(
      (event, emit) async {
        final currentState = state;

        if (currentState is! LoadedState) return;

        final categories = currentState.categories;

        emit(LoadedState(
          categories: categories,
          movies: Resource.pending(),
        ));

        final movieListResource = await getMovieList(event.catName);

        if (movieListResource.error != null) {
          emit(ErrorState());
        }

        emit(LoadedState(
          categories: categories,
          movies: movieListResource,
        ));
      },
    );

    add(LoadInitialDataEvent());
  }

  getMovies(String selectedCat) {
    add(GetMoviesForCategoryEvent(selectedCat));
  }

}
