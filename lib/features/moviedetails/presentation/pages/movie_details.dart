import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:movie_flutter_demo/features/homescreen/presentation/vo/like_param.dart';
import 'package:movie_flutter_demo/features/moviedetails/presentation/bloc/details_bloc.dart';
import 'package:movie_flutter_demo/features/moviedetails/presentation/bloc/details_state.dart';

import '../../../../core/di/injection.dart';

class MovieDetails extends StatelessWidget {
  final String movieId;
  bool isLike;
  final ValueChanged<LikeParam> valueChanged;

  MovieDetails({Key? key, required this.movieId, required this.isLike, required this.valueChanged}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Details'),
          centerTitle: true,
        ),
        body: provider(context),
      ),
    );
  }

  BlocProvider<DetailsBloc> provider(BuildContext context) {
    final bloc = getIt<DetailsBloc>();

    return BlocProvider(
      create: (_) => bloc,
      child: blocConsumer(bloc),
    );
  }

  BlocConsumer<DetailsBloc, DetailsState> blocConsumer(DetailsBloc bloc) {
    return BlocConsumer(
      builder: (context, state) {
        if (state is Pending) {
          bloc.getMoviesDetails(movieId);
          return _buildAllPending();
        } else if (state is ErrorState) {
          return _buildError();
        } else if (state is LoadedState) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Stack(
                      alignment: Alignment.topRight,
                      children: [
                        Image.network(
                          state.detailsEntity.moviePoster,
                          height: 175,
                          width: 175,
                          fit: BoxFit.fill,
                        ),
                         Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: InkWell(
                            child: Icon(
                              isLike
                                  ? Icons.favorite
                                  : Icons.favorite_border,
                              color: isLike
                                  ? Colors.red
                                  : Colors.white,
                            ),
                            onTap: () {
                              isLike = isLike == true? false : true;
                              valueChanged(LikeParam(movieId, isLike));
                              bloc.getMoviesDetails(movieId);
                            },
                          ),
                        ),
                      ]
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            state.detailsEntity.movieTitle,
                            overflow: TextOverflow.fade,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                color: Colors.black, fontSize: 20),
                          ),
                          RatingBarIndicator(
                            rating: state.detailsEntity.movieRating,
                            itemBuilder: (context, index) => const Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                            itemCount: 5,
                            itemSize: 30.0,
                            direction: Axis.horizontal,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  state.detailsEntity.movieDescription,
                  style: const TextStyle(
                    fontSize: 17,
                  ),
                ),
              ],
            ),
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
