import 'package:flutter/material.dart';
import 'package:movie_flutter_demo/features/homescreen/domain/entities/movies_category_entiy.dart';

import '../../domain/usecases/get_movie_category.dart';

class ListViewWidget extends StatelessWidget {
  final List<MovieCategoryData> categories;
  final ValueChanged<String> onSelect;
  const ListViewWidget({
    Key? key,
    required this.categories,
    required this.onSelect,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: categories.length,
          itemBuilder: (context, index) {
            return InkWell(
              child: Container(
                margin: const EdgeInsets.all(5),
                color: Colors.grey,
                padding: const EdgeInsets.all(5),
                child: Center(
                  child: Text(
                    categories[index].movieCat,
                    style: const TextStyle(color: Colors.white, fontSize: 20.0),
                  ),
                ),
              ),
              onTap: () {
                onSelect(categories[index].movieCat);
                print(categories[index].movieCat);
              },
            );
          }),
    );
  }
}
