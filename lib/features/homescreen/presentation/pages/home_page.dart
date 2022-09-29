import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_flutter_demo/features/homescreen/presentation/bloc/bloc.dart';
import 'package:movie_flutter_demo/features/homescreen/presentation/widgets/home_widget.dart';

import '../../../../core/di/injection.dart';
import '../../../addmovie/presentation/page/add_movie.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Movie'),
        centerTitle: true,
      ),
      body: provider(context),
    );
  }

  BlocProvider<HomeBloc> provider(BuildContext context) {
    final bloc = getIt<HomeBloc>();

    return BlocProvider(
      create: (_) => bloc,
      child: blocConsumer(bloc),
    );
  }

  BlocConsumer<HomeBloc, HomeState> blocConsumer(HomeBloc bloc) {
    return BlocConsumer(
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
            onCategorySelection: (value) {
              bloc.getMovies(value);
            },
            onAddItem: (value) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AddMovieScreen(
                    movieCat: state.categories,
                  ),
                ),
              );
            },
          );
        }
        return Container();
      },
      listener: ((context, state) {}),
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
