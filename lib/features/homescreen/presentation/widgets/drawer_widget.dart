import 'package:flutter/material.dart';
import 'package:movie_flutter_demo/features/addmovie/presentation/page/add_movie.dart';
import 'package:movie_flutter_demo/features/homescreen/domain/entities/movies_category_entiy.dart';
import 'package:movie_flutter_demo/features/homescreen/presentation/widgets/vertical_list_widget.dart';

class DrawerWidget extends StatelessWidget {
  final List<MovieCategoryData> movieCat;
  final ValueChanged<String> onCateCorySelection;
  final ValueChanged onAddItem;

  const DrawerWidget(
      {Key? key,
      required this.movieCat,
      required this.onCateCorySelection,
      required this.onAddItem})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: const EdgeInsets.all(0),
          children: [
            ListTile(
              title: const Text('Add Item',
                  style: TextStyle(fontSize: 20, fontStyle: FontStyle.normal)),
              onTap: () {
                // redirect to add movie screen
               onAddItem("ADD");
              },
            ),
            const Divider(
              color: Colors.grey,
            ),
            ExpansionTile(
              title: const Text('Select Category'),
              children: [
                VerticalListViewWidget(
                  moviesCat: movieCat,
                  onCategorySelection: (String value) {
                    onCateCorySelection(value);
                  },
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
