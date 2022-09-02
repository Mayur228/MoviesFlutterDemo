import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:movie_flutter_demo/features/homescreen/domain/entities/movies_category_entiy.dart';
import 'package:movie_flutter_demo/features/homescreen/domain/usecases/get_movie_category.dart';

class DropDownWidget extends StatelessWidget {
  final List<MovieCategoryData> category;
  final String selectedCategory;
  final ValueChanged onChange;
  const DropDownWidget({Key? key, required this.category, required this.onChange, required this.selectedCategory}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButtonFormField<String>(
        value: selectedCategory,
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
          onChange(newValue);
        },
        items: category.map((e) => e.movieCat).map((String items) {
          return DropdownMenuItem(
            value: items,
            child: Text(items),
          );
        }).toList(),
      ),
    );
  }

}

// class _DropDownWidgetState extends State<DropDownWidget> {
//
//   List<String> catItems = [];
//   late String selectedCat;
//
//   @override
//   void initState() {
//     super.initState();
//     movieCategory = GetMovieCategory();
//     // movieCategory?.getData().forEach((element) {
//     //   catItems.add(element.movieCat);
//     // });
//     catItems = catItems;
//     selectedCat = catItems.first;
//   }
//
//
// }
