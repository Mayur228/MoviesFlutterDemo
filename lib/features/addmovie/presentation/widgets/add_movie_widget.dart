import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:movie_flutter_demo/features/addmovie/data/datasources/entities/movies.dart';
import 'package:movie_flutter_demo/features/addmovie/presentation/widgets/actor_listview_widget.dart';
import 'package:movie_flutter_demo/features/addmovie/presentation/widgets/add_actor_dialog_widget.dart';
import 'package:movie_flutter_demo/features/addmovie/presentation/widgets/elevated_button.dart';
import 'package:movie_flutter_demo/features/addmovie/presentation/widgets/out_line_button_widget.dart';
import 'package:movie_flutter_demo/features/addmovie/presentation/widgets/rating_widget.dart';
import 'package:movie_flutter_demo/features/addmovie/presentation/widgets/text_field_widget.dart';
import 'package:movie_flutter_demo/features/addmovie/vo/actor_param.dart';
import 'package:movie_flutter_demo/features/homescreen/domain/entities/movies_category_entiy.dart';
import 'package:uuid/uuid.dart';

import 'drop_down_widget.dart';

class AddMovieWidget extends StatelessWidget {
  final List<MovieCategoryData> category;
  final ValueChanged onPressed;
  final ValueChanged<String> onCategorySelection;
  final ValueChanged<double> onRatingChange;
  final ValueChanged<List<ActorParam>> onActorUpdate;

  AddMovieWidget(
      {Key? key,
      required this.category,
      required this.onPressed,
      required this.onCategorySelection,
      required this.onRatingChange,
      required this.onActorUpdate})
      : super(key: key);

  TextEditingController myTitleTextController = TextEditingController();
  TextEditingController myDesTextController = TextEditingController();

  List<ActorParam> actorList = List.empty(growable: true);

  String? moviePoster = "";

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
                      onCategorySelection(selectedCat);
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
                                  }).then(
                                (value) {
                                  // onActorUpdate(value);
                                  actorList.add(value as ActorParam);
                                  onActorUpdate(actorList);
                                },
                              );
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
                  ActorListViewWidget(
                    list: actorList,
                  ),
                  SizedBox(
                    height: 150,
                    child: Image(
                      image: FileImage(
                        File(moviePoster.toString()),
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  RatingBarWidget(onRatingUpdate: (val) {
                    onRatingChange(val);
                  }),
                  const SizedBox(height: 15),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: ElevatedButtonWidget(
                      buttonText: "Submit",
                      onPressed: (value) {
                        onPressed(
                          Movies(
                            const Uuid().v1(),
                            myTitleTextController.text,
                            myDesTextController.text,
                            onCategorySelection.toString(),
                            "",
                            0,
                          ),
                        );
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

  openPicker() async {
    ImagePicker picker = ImagePicker();

    final photo = await picker.pickImage(source: ImageSource.gallery);
    moviePoster = photo?.path.toString();
    return photo?.path.toString();
  }

  Widget openAddActorDialog() {
    return AddActorDialogWidget();
  }

  // NetworkImage("https://www.wikihow.com/images/thumb/c/cf/Become-an-Actor-Step-1-Version-3.jpg/v4-460px-Become-an-Actor-Step-1-Version-3.jpg.webp"),
}
