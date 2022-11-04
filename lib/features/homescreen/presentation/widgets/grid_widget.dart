import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:movie_flutter_demo/features/homescreen/data/model/movie_list_model.dart';
import 'package:movie_flutter_demo/features/homescreen/domain/entities/movies_list_entiy.dart';
import 'package:movie_flutter_demo/features/homescreen/presentation/vo/like_param.dart';
import 'package:movie_flutter_demo/features/homescreen/presentation/vo/movie_vo.dart';

class GridViewWidget extends StatelessWidget {
  final MovieVo movies;

  // final IconData icons;
  final ValueChanged<LikeParam> valueChanged;
  final ValueChanged<String> movieId;

  const GridViewWidget({
    Key? key,
    required this.movies,
    required this.valueChanged,
    // required this.icons,
    required this.movieId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
        crossAxisCount: 2,
        children: List.generate(movies.list.length, (index) {
          return InkWell(
            onTap: () {
              valueChanged(LikeParam(movies.list[index].id,movies.list[index].isLike));
            },
            child: Container(
              margin: const EdgeInsets.all(5),
              color: Colors.white,
              child: Center(
                child: Card(
                  child: Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.fill,
                            image: NetworkImage(movies.list[index].poster),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: InkWell(
                            child: Icon(
                              movies.list[index].isLike
                                  ? Icons.favorite
                                  : Icons.favorite_border,
                              color: movies.list[index].isLike
                                  ? Colors.red
                                  : Colors.white,
                            ),
                            onTap: () {
                              movieId(movies.list[index].id);
                            },
                          ),
                        ),
                      ),
                      Align(
                          alignment: Alignment.bottomLeft,
                          child: Container(
                            color: Colors.black,
                            padding: const EdgeInsets.all(5),
                            margin: const EdgeInsets.fromLTRB(0, 0, 15, 25),
                            child: Text(
                              movies.list[index].name,
                              style: const TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                              ),
                            ),
                          )),
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: RatingBarIndicator(
                          rating: movies.list[index].rating,
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
              ),
            ),
          );
        }));
  }
}
