import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:movie_flutter_demo/features/addmovie/presentation/widgets/add_movie_widget.dart';

class OutLineButtonWidget extends StatelessWidget {
  final String buttonText;
  final ValueChanged onPressed;
  const OutLineButtonWidget({Key? key, required this.buttonText, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
        onPressed: () => {
          if(buttonText == "Add Movie Poster"){
            onPressed("ADD_POSTER")
          }else{
            onPressed("ADD_ACTOR")
          }
        },
        child:Text(buttonText)
    );
  }
}
