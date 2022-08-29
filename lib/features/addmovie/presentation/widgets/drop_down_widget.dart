
import 'package:flutter/material.dart';
import 'package:movie_flutter_demo/features/homescreen/domain/usecases/get_movie_category.dart';

class DropDownWidget extends StatefulWidget {
  const DropDownWidget({Key? key}) : super(key: key);

  @override
  State<DropDownWidget> createState() => _DropDownWidgetState();
}

class _DropDownWidgetState extends State<DropDownWidget> {
  GetMovieCategory? movieCategory;

  @override
  void initState() {
    super.initState();
    movieCategory = GetMovieCategory();
  }
  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: movieCategory?.getData()[0].movieCat,
      icon: const Icon(Icons.arrow_downward),
      elevation: 16,
      style: const TextStyle(color: Colors.deepPurple),
      underline: Container(
        height: 2,
        color: Colors.deepPurpleAccent,
      ),
      onChanged: (String? newValue) {
        setState(() {
          // dropdownValue = newValue!;
        });
      },
      items: movieCategory?.getData()
    );
  }
}
