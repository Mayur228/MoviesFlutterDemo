import 'package:flutter/material.dart';

import '../../domain/usecases/get_movie_category.dart';

class VerticalListViewWidget extends StatefulWidget {
  const VerticalListViewWidget({Key? key}) : super(key: key);

  @override
  State<VerticalListViewWidget> createState() => _VerticalListViewWidgetState();
}

class _VerticalListViewWidgetState extends State<VerticalListViewWidget> {
  GetMovieCategory? movieCategory;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    movieCategory = GetMovieCategory();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: movieCategory!.getData().length,
        itemBuilder: (context, index) {
          return ListTile(
            title :Text(movieCategory!.getData()[index].movieCat,
              style: const TextStyle(color: Colors.black,fontSize: 18.0),)
          );
        });
  }
}
