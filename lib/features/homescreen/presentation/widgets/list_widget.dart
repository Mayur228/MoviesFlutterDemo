import 'package:flutter/material.dart';

import '../../domain/usecases/get_movie_category.dart';

class ListViewWidget extends StatefulWidget {
  const ListViewWidget({Key? key}) : super(key: key);

  @override
  State<ListViewWidget> createState() => _ListViewWidgetState();
}

class _ListViewWidgetState extends State<ListViewWidget> {
  GetMovieCategory? movieCategory;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    movieCategory = GetMovieCategory();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: movieCategory!.getData().length,
          itemBuilder: (context, index) {
            return Container(
              margin: const EdgeInsets.all(5),
              color: Colors.grey,
              padding: const EdgeInsets.all(5),
              child: Center(
                child: Text(
                  movieCategory!.getData()[index].movieCat,
                  style: const TextStyle(color: Colors.white,fontSize: 20.0),
                ),
              ),
            );
          }),
    );
  }
}
