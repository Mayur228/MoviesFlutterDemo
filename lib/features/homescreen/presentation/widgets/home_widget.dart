import 'package:flutter/material.dart';
import 'package:movie_flutter_demo/core/util/resource.dart';
import 'package:movie_flutter_demo/features/homescreen/data/model/movie_list_model.dart';
import 'package:movie_flutter_demo/features/homescreen/domain/entities/movies_list_entiy.dart';
import 'package:movie_flutter_demo/features/homescreen/presentation/vo/like_param.dart';
import 'package:movie_flutter_demo/features/homescreen/presentation/vo/movie_vo.dart';
import 'package:movie_flutter_demo/features/homescreen/presentation/widgets/grid_widget.dart';
import 'package:movie_flutter_demo/features/homescreen/presentation/widgets/list_widget.dart';

import '../../domain/entities/movies_category_entiy.dart';
import 'drawer_widget.dart';

class HomeWidget extends StatelessWidget {
  final List<MovieCategoryData> categories;
  final Resource<MovieVo> movies;
  final ValueChanged<String> onSelect;
  final ValueChanged<String> onCategorySelection;
  final ValueChanged onAddItem;
  final ValueChanged<LikeParam> openMovieDetails;
  // final IconData icons;
  final ValueChanged<String> movieId;

  const HomeWidget({
    Key? key,
    required this.categories,
    required this.movies,
    required this.onSelect,
    required this.onCategorySelection,
    required this.onAddItem,
    required this.openMovieDetails,
    // required this.icons,
    required this.movieId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          ListViewWidget(
            categories: categories,
            onSelect: (val) {
              onSelect(val);
            },
          ),
          Expanded(child: _buildMovieList()),
        ],
      ),
      drawer: DrawerWidget(
        movieCat: categories,
        onAddItem: (value) {
          Navigator.pop(context);
          onAddItem("Add");
        },
        onCateCorySelection: (value) {
          Navigator.pop(context);
          onCategorySelection(value);
        },
      ),
    );
  }

  Widget _buildMovieList() {
    return movies.when(
      data: (data) {
        return GridViewWidget(
          movies: data,
          valueChanged: (value) {
            openMovieDetails(value);
          },
          // icons: icons,
          movieId: (String value) {
            movieId(value);
          },
        );
      },
      error: (error) {
        // return Center(child: Text("Error in getting movie list"));
        return Center(child: Text(error));
      },
      pending: () {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
