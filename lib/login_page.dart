import 'package:flutter/material.dart';

import 'profile_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController firstName = TextEditingController();

  TextEditingController lastName = TextEditingController();

  List<String> listOfImage = [
    "https://img.freepik.com/premium-vector/woman-profile-cartoon_18591-58480.jpg",
    "https://m.media-amazon.com/images/I/41miU+cgrLL.jpg",
    "https://img.freepik.com/premium-vector/man-profile-cartoon_18591-58482.jpg?w=2000",
    "https://img.freepik.com/premium-vector/man-profile-cartoon_18591-58483.jpg?w=2000"
  ];

  int selectIndexImage = -1;
  bool isNameEmpty = false;
  bool isSecondNameEmpty = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          title: const Text("Login"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 100,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: listOfImage.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: InkWell(
                          child: Container(
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.all(
                                Radius.circular(16),
                              ),
                              border: Border.all(
                                  color: selectIndexImage == index
                                      ? Colors.blue
                                      : Colors.grey,
                                  width: 4),
                              image: DecorationImage(
                                  image: NetworkImage(listOfImage[index]),
                                  fit: BoxFit.cover),
                            ),
                          ),
                          onTap: () {
                            if (selectIndexImage == index) {
                              selectIndexImage = -1;
                            } else {
                              selectIndexImage = index;
                            }
                            setState(() {});
                          },
                        ),
                      );
                    }),
              ),
              const SizedBox(
                height: 24,
              ),
              TextFormField(
                onChanged: (value) {
                  isNameEmpty = false;
                  setState(() {});
                },
                controller: firstName,
                decoration: const InputDecoration(
                    labelText: "First name",
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(),
                    enabledBorder: OutlineInputBorder(),
                    errorBorder: OutlineInputBorder()),
              ),
              isNameEmpty
                  ? const Text(
                      "You must write name",
                      style: TextStyle(color: Colors.red),
                    )
                  : const SizedBox.shrink(),
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: TextFormField(
                  onChanged: (value) {
                    isSecondNameEmpty = false;
                    setState(() {});
                  },
                  controller: lastName,
                  decoration: const InputDecoration(
                    labelText: "Last name",
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(),
                    enabledBorder: OutlineInputBorder(),
                    errorBorder: OutlineInputBorder(),
                  ),
                ),
              ),
              isSecondNameEmpty
                  ? const Text(
                      "You must write second name",
                      style: TextStyle(color: Colors.red),
                    )
                  : const SizedBox.shrink(),
              ElevatedButton(
                  onPressed: () {
                    if (firstName.text.isNotEmpty) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) {
                            return ProfilePage(
                              name: firstName.text,
                              lastName: lastName.text,
                              avatar: selectIndexImage == -1
                                  ? ""
                                  : listOfImage[selectIndexImage],
                            );
                          },
                        ),
                      );
                    } else {
                      isSecondNameEmpty = true;
                      isNameEmpty = true;
                      setState(() {});
                    }
                  },
                  child: const Text("Login"))
            ],
          ),
        ));
  }
}
