import 'package:flutter/material.dart';
import 'package:movie_flutter_demo/core/di/injection.dart';
import 'package:movie_flutter_demo/features/homescreen/presentation/pages/home_page.dart';
import 'package:movie_flutter_demo/features/moviedetails/presentation/pages/movie_details.dart';

void main() {
  configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
    );
  }
}