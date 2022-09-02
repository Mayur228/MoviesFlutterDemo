import 'package:flutter/material.dart';
import 'package:movie_flutter_demo/features/homescreen/domain/entities/movies_category_entiy.dart';

import '../../domain/usecases/get_movie_category.dart';

class VerticalListViewWidget extends StatelessWidget {
  final  List<MovieCategoryData> moviesCat;
  const VerticalListViewWidget({Key? key, required this.moviesCat}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: moviesCat.length,
        itemBuilder: (context, index) {
          return ListTile(
            title :Text(moviesCat[index].movieCat,
              style: const TextStyle(color: Colors.black,fontSize: 18.0),)
          );
        });

  }
}
