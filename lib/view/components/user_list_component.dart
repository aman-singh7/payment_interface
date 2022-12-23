import 'package:flutter/material.dart';

import '../../model/user_model.dart';

class UserListComponent extends StatelessWidget {
  final ScrollController controller;

  const UserListComponent({Key? key, required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      width: double.infinity,
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
        ),
        itemCount: dummyData.length + 1,
        controller: controller,
        itemBuilder: (context, i) {
          if (i == dummyData.length) {
            return InkWell(
              onTap: () {},
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.grey[300],
                    child: const Icon(
                      Icons.keyboard_arrow_down,
                      size: 50,
                      color: Colors.black,
                    ),
                  ),
                  const Text(
                    "Show More",
                    style: TextStyle(
                      color: Colors.black54,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            );
          }

          return GridTile(
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed('/pay');
              },
              child: Column(
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(dummyData[i].imgUrl),
                    radius: 30,
                  ),
                  const SizedBox(height: 2),
                  Text(
                    dummyData[i].name,
                    style: const TextStyle(
                      color: Colors.black54,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
