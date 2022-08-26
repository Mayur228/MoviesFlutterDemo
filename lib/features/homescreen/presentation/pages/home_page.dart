import 'package:flutter/material.dart';
import 'package:movie_flutter_demo/features/homescreen/domain/usecases/get_movie_category.dart';
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
        leading: const Icon(Icons.menu),
      ),
      body: Column(
        children: [
          const Expanded(child: ListViewWidget()),
          Expanded(child: GridViewWidget()),
        ],
      ),
    );
  }

  /*Row(
  mainAxisAlignment: MainAxisAlignment.spaceAround,
  mainAxisSize: MainAxisSize.max,
  children: [ListViewWidget()],
  )*/
}
