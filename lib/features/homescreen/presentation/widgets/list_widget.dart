import 'package:flutter/material.dart';

import '../../domain/usecases/get_movie_category.dart';

class ListViewWidget extends StatelessWidget {
  const ListViewWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GetMovieCategory movieCategory;

    movieCategory = GetMovieCategory();

    return ListView.builder(
        itemCount: movieCategory.getData().length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(movieCategory.getData()[index].movieCat),
          );
        });
  }
}
