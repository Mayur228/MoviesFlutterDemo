import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_flutter_demo/features/homescreen/data/repository/movie_repository_impl.dart';
import 'package:movie_flutter_demo/features/homescreen/domain/usecases/get_movie_category.dart';
import 'package:movie_flutter_demo/features/homescreen/domain/usecases/get_movie_list.dart';
import 'package:movie_flutter_demo/features/homescreen/presentation/bloc/bloc.dart';
import 'package:movie_flutter_demo/features/homescreen/presentation/widgets/home_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(  appBar: AppBar(
      title: const Text('Movie'),
      centerTitle: true,
    ),
      body: provider(context),
    );
  }

  BlocProvider<HomeBloc> provider(BuildContext context) {
    final bloc = HomeBloc(
      category: GetMovieCategory(),
      movies: GetMovieList(MovieRepositoryImpl()),
    );

    return BlocProvider(
      create: (_) => bloc,
      child: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state is Pending) {
            return _buildAllPending();
          } else if (state is ErrorState) {
            return _buildError();
          } else if (state is LoadedState) {
            return HomeWidget(
              categories: state.categories,
              movies: state.movies,
              onSelect: (String selectedCat) {
                bloc.getMovies(selectedCat);
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
