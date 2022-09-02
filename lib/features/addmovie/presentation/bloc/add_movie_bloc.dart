import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_flutter_demo/features/addmovie/data/datasources/entities/movies.dart';
import 'package:movie_flutter_demo/features/addmovie/domain/usecases/add_movies_usecase.dart';
import 'package:movie_flutter_demo/features/addmovie/presentation/bloc/add_movie_event.dart';
import 'package:movie_flutter_demo/features/addmovie/presentation/bloc/add_movie_state.dart';
import 'package:movie_flutter_demo/features/homescreen/domain/entities/movies_category_entiy.dart';

class AddMovieBloc extends Bloc<AddMovieEvent, AddMovieState> {
  final List<MovieCategoryData> category;
  final AddMoviesUseCase addMovies;

  AddMovieBloc({required List<MovieCategoryData> categories,required AddMoviesUseCase moviesUseCase})
      : category = categories,
        addMovies = moviesUseCase,
        super(PendingState()) {
    on<SetDropDownCategoryDataEvent>(
      (event, emit) async {
        emit(LoadedState(category));
      },
    );
  }

  setCategoryDropDown(List<MovieCategoryData> list) {
    add(SetDropDownCategoryDataEvent(list));
  }

  addMovie(Movies movies) {
    addMovies.repository.addMovies(movies);
  }
}
