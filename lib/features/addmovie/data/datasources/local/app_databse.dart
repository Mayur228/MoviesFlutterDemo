import 'dart:async';
import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

import 'package:movie_flutter_demo/features/addmovie/data/datasources/local/movies_dao.dart';
import 'package:movie_flutter_demo/features/addmovie/data/datasources/entities/movies.dart';

part 'app_databse.g.dart';

@Database(version: 1, entities: [Movies])
abstract class AppDatabase extends FloorDatabase{
  MoviesDao get moviesDao;
}