
import 'package:flutter/material.dart';
import 'package:movie_flutter_demo/features/addmovie/presentation/page/add_movie.dart';
import 'package:movie_flutter_demo/features/homescreen/presentation/widgets/vertical_list_widget.dart';

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            ListTile(
              title: const Text('Add Item',
                style: TextStyle(
                  fontSize: 20,
                  fontStyle: FontStyle.normal
                )),
              onTap: () {
               // redirect to add movie screen
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AddMovieScreen()),
                );
              },
            ),
            const Divider(
              color: Colors.grey,
            ),
            const ExpansionTile(title: Text('Select Category'),
            children: [
              VerticalListViewWidget()
            ],)
          ],
        ),
      ),
    );
  }
}
