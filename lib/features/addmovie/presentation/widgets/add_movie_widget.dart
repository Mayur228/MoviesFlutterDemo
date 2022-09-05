import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:image_picker/image_picker.dart';
import 'package:movie_flutter_demo/features/addmovie/data/datasources/entities/movies.dart';
import 'package:movie_flutter_demo/features/addmovie/presentation/widgets/actor_listview_widget.dart';
import 'package:movie_flutter_demo/features/addmovie/presentation/widgets/add_actor_dialog_widget.dart';
import 'package:movie_flutter_demo/features/addmovie/presentation/widgets/elevated_button.dart';
import 'package:movie_flutter_demo/features/addmovie/presentation/widgets/out_line_button_widget.dart';
import 'package:movie_flutter_demo/features/addmovie/presentation/widgets/rating_widget.dart';
import 'package:movie_flutter_demo/features/addmovie/presentation/widgets/text_field_widget.dart';
import 'package:movie_flutter_demo/features/homescreen/domain/entities/movies_category_entiy.dart';
import 'package:uuid/uuid.dart';

import 'drop_down_widget.dart';

class AddMovieWidget extends StatelessWidget {
  final List<MovieCategoryData> category;
  final ValueChanged onPressed;

  AddMovieWidget({Key? key, required this.category, required this.onPressed})
      : super(key: key);

  TextEditingController myTitleTextController = TextEditingController();
  TextEditingController myDesTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        // physics: const NeverScrollableScrollPhysics(),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              padding: const EdgeInsets.all(15),
              child: Column(
                children: [
                  DropDownWidget(
                    category: category,
                    selectedCategory: category.first.movieCat,
                    onChange: (selectedCat) {
                      // onChanged(selectedCat)
                    },
                  ),
                  const SizedBox(height: 15),
                  // const DropDownWidget(),
                  // const SizedBox(height: 15),
                  TextFieldWidget(
                    hintText: 'Enter Movie Title',
                    textEditingController: myTitleTextController,
                  ),
                  const SizedBox(height: 15),
                  TextFieldWidget(
                    hintText: 'Enter Movie Description',
                    textEditingController: myDesTextController,
                  ),
                  const SizedBox(height: 15),
                  Row(
                    children: [
                      Expanded(
                        child: OutLineButtonWidget(
                          buttonText: "Add Actor",
                          onPressed: (value) {
                            if (value == "ADD_ACTOR") {
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return openAddActorDialog();
                                  });
                            }
                          },
                        ),
                      ),
                      const SizedBox(width: 5),
                      Expanded(
                        child: OutLineButtonWidget(
                          buttonText: "Add Movie Poster",
                          onPressed: (value) {
                            if (value == "ADD_POSTER") {
                              openPicker();
                            }
                          },
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 15),
                  const ActorListViewWidget(),
                  const SizedBox(
                    height: 150,
                    child: Image(image: NetworkImage("https://assets.mubicdn.net/images/notebook/post_images/19893/images-w1400.jpg?1449196747")),
                  ),
                  const SizedBox(height: 15),
                  RatingBarWidget(onRatingUpdate: (val) {
                    print(val);
                  }),
                  const SizedBox(height: 15),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: ElevatedButtonWidget(
                      buttonText: "Submit",
                      onPressed: (value) {
                        onPressed(Movies(
                            Uuid().v1(),
                            myTitleTextController.text,
                            myDesTextController.text,
                            "Bollywood",
                            "",
                            0));
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  openPicker() {
    ImagePicker _picker = ImagePicker();

    _picker.pickImage(source: ImageSource.gallery);
  }

  Widget openAddActorDialog() {
    return const AddActorDialogWidget();
  }
}
