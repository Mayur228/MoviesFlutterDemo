import 'package:flutter/material.dart';
import 'package:movie_flutter_demo/features/homescreen/presentation/widgets/drawer_widget.dart';
import 'package:movie_flutter_demo/features/homescreen/presentation/widgets/grid_widget.dart';
import 'package:movie_flutter_demo/features/homescreen/presentation/widgets/list_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Movie'),
        centerTitle: true,
      ),
      body: Column(
        // mainAxisSize: MainAxisSize.max,
        children: const [
          ListViewWidget(),
          Expanded(child: GridViewWidget()),
        ],
      ),
      drawer: const DrawerWidget()
    );
  }
}
