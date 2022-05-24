import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'cart.dart';
import 'home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create: (context) => Cart(),
    child: const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Home page",
      home: HomePage(),
    ),
    );
  }
}
