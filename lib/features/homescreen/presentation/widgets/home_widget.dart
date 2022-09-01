import 'package:flutter/material.dart';
import 'package:movie_flutter_demo/core/util/resource.dart';
import 'package:movie_flutter_demo/features/homescreen/domain/entities/movies_list_entiy.dart';
import 'package:movie_flutter_demo/features/homescreen/presentation/widgets/grid_widget.dart';
import 'package:movie_flutter_demo/features/homescreen/presentation/widgets/list_widget.dart';

import '../../domain/entities/movies_category_entiy.dart';

class HomeWidget extends StatelessWidget {
  final List<MovieCategoryData> categories;
  final Resource<List<MovieListData>> movies;
  final ValueChanged<String> onSelect;

  const HomeWidget({
    Key? key,
    required this.categories,
    required this.movies,
    required this.onSelect,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListViewWidget(
          categories: categories,
          onSelect: (val) {
            onSelect(val);
          },
        ),
        Expanded(child: _buildMovieList()),
      ],
    );
  }

  Widget _buildMovieList() {
    return movies.when(
      data: (data) {
        return GridViewWidget(movies: data);
      },
      error: (error) {
        // return Center(child: Text("Error in getting movie list"));
        return Center(child: Text(error));
      },
      pending: () {
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
