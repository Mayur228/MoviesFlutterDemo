import 'dart:io';

import 'package:flutter/material.dart';
import 'package:movie_flutter_demo/features/addmovie/vo/actor_param.dart';

class ActorListViewWidget extends StatelessWidget {
  final List<ActorParam> list;

  const ActorListViewWidget({Key? key, required this.list}) : super(key: key);

  // "https://www.wikihow.com/images/thumb/c/cf/Become-an-Actor-Step-1-Version-3.jpg/v4-460px-Become-an-Actor-Step-1-Version-3.jpg.webp"
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: list.length,
          itemBuilder: (context, index) {
            return Container(
              margin: const EdgeInsets.all(5),
              padding: const EdgeInsets.all(5),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 25,
                    backgroundImage: FileImage(File(list[index].actorProfile!)),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    list[index].actorName,
                    style: const TextStyle(color: Colors.black, fontSize: 18.0),
                  ),
                ],
              ),
            );
          }),
    );
  }
}
