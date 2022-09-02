import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:movie_flutter_demo/features/homescreen/domain/entities/movies_list_entiy.dart';

class GridViewWidget extends StatelessWidget {

  final List<MovieListData> movies;

  const GridViewWidget({Key? key, required this.movies}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return GridView.count(
        crossAxisCount: 2,
        children: List.generate(movies.length, (index) {
          return Container(
            margin: const EdgeInsets.all(5),
            color: Colors.white,
            child: Center(
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.fill,
                            image: NetworkImage(
                                movies[index].moviePoster))),
                  ),
                  Align(
                      alignment: Alignment.bottomLeft,
                      child: Container(
                        color: Colors.black,
                        padding: const EdgeInsets.all(5),
                        margin: const EdgeInsets.fromLTRB(0, 0, 15, 25),
                        child: const Text(
                          'Movie Name',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                      )),
                  Align(alignment: Alignment.bottomLeft, child: RatingBarIndicator(
                    rating: movies[index].movieRating,
                    itemBuilder: (context, index) => const Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    itemCount: 5,
                    itemSize: 30.0,
                    direction: Axis.horizontal,
                  ),
                  )
                ],
              ),
            ),
          );
        }));
  }
}
