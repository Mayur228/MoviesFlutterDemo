import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:image_picker/image_picker.dart';

import '../widgets/drop_down_widget.dart';

class AddMovieScreen extends StatefulWidget {
  const AddMovieScreen({Key? key}) : super(key: key);

  @override
  State<AddMovieScreen> createState() => _AddMovieScreenState();
}

class _AddMovieScreenState extends State<AddMovieScreen> {
  ImagePicker? _picker;

  @override
  void initState() {
    super.initState();
    _picker = ImagePicker();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Add Movie'),
          centerTitle: true,
        ),
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              padding: const EdgeInsets.all(15),
              child: Column(
                children: [
                  const DropDownWidget(),
                  const SizedBox(height: 15),
                  const DropDownWidget(),
                  const SizedBox(height: 15),
                  const TextField(
                    decoration: InputDecoration(
                      hintText: 'Enter Movie Title',
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.teal, style: BorderStyle.solid),
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  const TextField(
                    decoration: InputDecoration(
                      hintText: 'Enter Movie Description',
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.teal, style: BorderStyle.solid),
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  Row(
                    children: [
                      Expanded(
                        child: OutlinedButton(
                            onPressed: () => {},
                            child: const Text('Add Actors')),
                      ),
                      // OutlinedButton(
                      //     onPressed: () => {}, child: const Text('Add Movie\n Cover')
                      // ),
                      const SizedBox(width: 5),
                      Expanded(
                        child: OutlinedButton(
                            onPressed: () => {
                                  _picker?.pickImage(
                                      source: ImageSource.gallery)
                                },
                            child: const Text('Add Movie Poster')),
                      )
                    ],
                  ),
                  const SizedBox(height: 15),
                  RatingBar.builder(
                    initialRating: 3,
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                    itemBuilder: (context, _) => const Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    glow: false,
                    onRatingUpdate: (rating) {
                      print(rating);
                    },
                  ),
                  const SizedBox(height: 15),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: ElevatedButton(
                        onPressed: () => {}, child: const Text('Submit')),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
