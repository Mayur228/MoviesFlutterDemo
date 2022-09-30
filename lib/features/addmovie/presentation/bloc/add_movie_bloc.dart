import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_flutter_demo/features/addmovie/domain/usecases/add_movies_usecase.dart';
import 'package:movie_flutter_demo/features/addmovie/domain/usecases/get_movies_usecase.dart';
import 'package:movie_flutter_demo/features/addmovie/presentation/bloc/add_movie_event.dart';
import 'package:movie_flutter_demo/features/addmovie/presentation/bloc/add_movie_state.dart';
import 'package:movie_flutter_demo/features/homescreen/domain/entities/movies_category_entiy.dart';

import '../../data/datasources/entities/movies.dart';

class AddMovieBloc extends Bloc<AddMovieEvent, AddMovieState> {
  final List<MovieCategoryData> category;
  final AddMoviesUseCase addMovies;
  final GetMoviesUseCase getMovies;

  AddMovieBloc(
      {required List<MovieCategoryData> categories,
      required AddMoviesUseCase moviesUseCase,
      required GetMoviesUseCase movies})
      : category = categories,
        addMovies = moviesUseCase,
        getMovies = movies,
        super(PendingState()) {
    on<SetDropDownCategoryDataEvent>(
      (event, emit) async {
        emit(LoadedState(category));
      },
    );

    on<GetMoviesEvent>((event, emit) async {
      final List<Movies> list = await getMovies();
      print(list.first.title);
    });

    add(GetMoviesEvent());
  }

  setCategoryDropDown(List<MovieCategoryData> list) {
    add(SetDropDownCategoryDataEvent(list));
  }

  addMovie(Movies movies) {
    addMovies.repository.addMovies(movies);
  }
}