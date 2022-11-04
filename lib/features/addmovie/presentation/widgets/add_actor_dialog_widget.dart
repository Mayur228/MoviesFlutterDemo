import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:movie_flutter_demo/features/addmovie/presentation/widgets/elevated_button.dart';
import 'package:movie_flutter_demo/features/addmovie/presentation/widgets/text_field_widget.dart';
import 'package:movie_flutter_demo/features/addmovie/vo/actor_param.dart';

class AddActorDialogWidget extends StatelessWidget {
  AddActorDialogWidget({Key? key}) : super(key: key);

  final TextEditingController actorNameController = TextEditingController();
  String? profileUrl = "";
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextFieldWidget(
            hintText: "Enter Actor Name",
            textEditingController: actorNameController,
          ),
          const SizedBox(
            height: 10,
            width: 10,
          ),
          Center(
            child: IconButton(
              onPressed: () => {
                openPicker(),
              },
              icon: const Icon(Icons.add_photo_alternate_outlined),
            ),
          ),
          const SizedBox(
            height: 10,
            width: 10,
          ),
          ElevatedButtonWidget(
            buttonText: "Submit",
            onPressed: (value) {
              Navigator.pop(context,ActorParam(actorName: actorNameController.text, actorProfile: profileUrl));
            },
          ),
          const SizedBox(
            height: 10,
            width: 10,
          ),
        ],
      ),
    );
  }

  Future<String?> openPicker() async {
    ImagePicker picker = ImagePicker();
    final actorProfile = await picker.pickImage(
      source: ImageSource.gallery,
    );
    profileUrl = actorProfile?.path.toString();
   return actorProfile?.path.toString();
  }
}
