import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_flutter_demo/features/addmovie/data/repository/movie_repository_impl.dart';
import 'package:movie_flutter_demo/features/addmovie/domain/usecases/get_movies_usecase.dart';
import 'package:movie_flutter_demo/features/addmovie/presentation/bloc/add_movie_bloc.dart';
import 'package:movie_flutter_demo/features/addmovie/presentation/bloc/add_movie_state.dart';
import 'package:movie_flutter_demo/features/addmovie/presentation/widgets/add_movie_widget.dart';
import 'package:movie_flutter_demo/features/homescreen/domain/entities/movies_category_entiy.dart';

import '../../domain/usecases/add_movies_usecase.dart';
import '../../vo/actor_param.dart';

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
      moviesUseCase: AddMoviesUseCase(MovieRepositoryImpl()),
      movies: GetMoviesUseCase(MovieRepositoryImpl()),
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
              onCategorySelection: (String value) {},
              onRatingChange: (double value) {},
              onActorUpdate: (List<ActorParam> value) {},
            );
          } else if (state is ErrorState) {
            return _buildError();
          } else if (state is LoadedState) {
            return AddMovieWidget(
              category: movieCat,
              onPressed: (val) {
                bloc.addMovies(val);
              },
              onCategorySelection: (String value) {},
              onRatingChange: (double value) {},
              onActorUpdate: (List<ActorParam> value) {
                print(value.first.actorName);
              },
            );
          }
          return Container();
        },
      ),
    );
  }

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
