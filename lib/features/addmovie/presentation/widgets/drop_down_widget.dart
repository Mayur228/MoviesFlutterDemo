import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:movie_flutter_demo/features/homescreen/domain/usecases/get_movie_category.dart';

class DropDownWidget extends StatefulWidget {
  const DropDownWidget({Key? key}) : super(key: key);

  @override
  State<DropDownWidget> createState() => _DropDownWidgetState();
}

class _DropDownWidgetState extends State<DropDownWidget> {
  GetMovieCategory? movieCategory;

  List<String> catItems = [];
  late String selectedCat;

  @override
  void initState() {
    super.initState();
    movieCategory = GetMovieCategory();
    // movieCategory?.getData().forEach((element) {
    //   catItems.add(element.movieCat);
    // });
    catItems = catItems;
    selectedCat = catItems.first;
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButtonFormField<String>(
        value: selectedCat,
        icon: const Icon(Icons.keyboard_arrow_down_rounded),
        elevation: 16,
        style: const TextStyle(color: Colors.black),
        decoration: const InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey, width: 1),
            borderRadius: BorderRadius.all(Radius.elliptical(5, 5)),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey, width: 1),
            borderRadius: BorderRadius.all(Radius.elliptical(5, 5)),
          ),
        ),
        onChanged: (String? newValue) {
          setState(() {
            selectedCat = newValue!;
          });
        },
        items: catItems.map((String items) {
          return DropdownMenuItem(
            value: items,
            child: Text(items),
          );
        }).toList(),
      ),
    );
  }
}
