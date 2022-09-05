import 'package:flutter/material.dart';

class ActorListViewWidget extends StatelessWidget {
  const ActorListViewWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: 10,
          itemBuilder: (context, index) {
            return Container(
              margin: const EdgeInsets.all(5),
              padding: const EdgeInsets.all(5),
              child: Row(
                children: const [
                  CircleAvatar(
                    radius: 25,
                    backgroundImage: NetworkImage(
                      "https://www.wikihow.com/images/thumb/c/cf/Become-an-Actor-Step-1-Version-3.jpg/v4-460px-Become-an-Actor-Step-1-Version-3.jpg.webp",
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "actor1",
                    style: TextStyle(color: Colors.black, fontSize: 18.0),
                  ),
                ],
              ),
            );
          }),
    );
  }
}
