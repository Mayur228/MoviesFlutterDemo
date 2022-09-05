import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:movie_flutter_demo/features/addmovie/presentation/widgets/elevated_button.dart';
import 'package:movie_flutter_demo/features/addmovie/presentation/widgets/text_field_widget.dart';

class AddActorDialogWidget extends StatelessWidget {
  const AddActorDialogWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextFieldWidget(hintText: "Enter Actor Name",textEditingController: TextEditingController(),),
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
          ElevatedButtonWidget(buttonText: "Submit", onPressed: (value) {  },),
          const SizedBox(
            height: 10,
            width: 10,
          ),
        ],
      ),
    );
  }

  openPicker() {
    ImagePicker picker = ImagePicker();
    picker.pickImage(
      source: ImageSource.gallery,
    );
  }
}
