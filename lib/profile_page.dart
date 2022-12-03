import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  final String name;
  final String lastName;
  final String avatar;

  const ProfilePage(
      {Key? key,
      required this.name,
      required this.lastName,
      required this.avatar})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile page"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            avatar.isEmpty
                ? Container(
                    width: 200,
                    height: 200,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.red,
                    ),
                    child: Center(
                        child: Text(
                      "${name[0]}${lastName[0]}",
                      style: const TextStyle(fontSize: 24),
                    )),
                  )
                : Container(
                    width: 200,
                    height: 200,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: NetworkImage(avatar),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
            Text(
              "Profile name : $name ",
              style: const TextStyle(fontSize: 24),
            ),
            const SizedBox(
              height: 24,
            ),
            Text(
              "Profile last name : $lastName ",
              style: const TextStyle(fontSize: 24),
            ),
          ],
        ),
      ),
    );
  }
}
