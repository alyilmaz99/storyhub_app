import 'package:flutter/material.dart';
<<<<<<< HEAD

import 'view/home_page.dart';
=======
import 'package:storyhub/view/home_page.dart';
>>>>>>> 6213cb2ac77879a4506563e31f24b8ebad66b037

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: HomePage(),
    );
  }
}
