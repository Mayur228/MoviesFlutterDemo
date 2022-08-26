import 'package:flutter/material.dart';
import 'package:movie_flutter_demo/features/homescreen/domain/usecases/get_movie_list.dart';

class GridViewWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final GetMovieList movieList;

    movieList = GetMovieList();

    return GridView.count(
        crossAxisCount: 2,
        children: List.generate(movieList.getData().length, (index) {
          return Center(
            child: Text(movieList.getData()[index].movieName),
          );
        }));
  }
}
