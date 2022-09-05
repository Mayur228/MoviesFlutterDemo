import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_flutter_demo/features/addmovie/data/repository/movie_repository.dart';
import 'package:movie_flutter_demo/features/addmovie/domain/usecases/add_movies_usecase.dart';
import 'package:movie_flutter_demo/features/addmovie/presentation/bloc/add_movie_bloc.dart';
import 'package:movie_flutter_demo/features/addmovie/presentation/bloc/add_movie_state.dart';
import 'package:movie_flutter_demo/features/addmovie/presentation/page/test.dart';
import 'package:movie_flutter_demo/features/addmovie/presentation/widgets/add_movie_widget.dart';
import 'package:movie_flutter_demo/features/homescreen/domain/entities/movies_category_entiy.dart';

import '../../data/datasources/local/app_databse.dart';


class AddMovieScreen extends StatelessWidget {
  final List<MovieCategoryData> movieCat;

  const AddMovieScreen({Key? key, required this.movieCat}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Add Movie'),
          centerTitle: true,
        ),
        body: provider(context),
      ),
    );
  }

  BlocProvider<AddMovieBloc> provider(BuildContext context) {

    final bloc = AddMovieBloc(
      categories: movieCat,
      moviesUseCase: AddMoviesUseCase(MovieRepositoryImpl(AppDataBaseImpl())),
    );

    return BlocProvider(
      create: (_) => bloc,
      child: BlocBuilder<AddMovieBloc, AddMovieState>(
        builder: (context, state) {
          if (state is PendingState) {
            // return _buildAllPending();
            return AddMovieWidget(
              category: movieCat,
              onPressed: (val) {
                bloc.addMovies(val);
              },
            );
          } else if (state is ErrorState) {
            return _buildError();
          } else if (state is LoadedState) {
            return AddMovieWidget(
              category: movieCat,
              onPressed: (val) {
                bloc.addMovies(val);
              },
            );
          }
          return Container();
        },
      ),
    );
  }

  /*provideDatabase() async {
    final database = await $FloorAppDatabase.databaseBuilder('movieDatabase.db').build();

   return database;
  }*/

  Widget _buildAllPending() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _buildError() {
    return const Center(
      child: Text("Error in loading data"),
    );
  }
}
