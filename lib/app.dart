import 'package:flutter/material.dart';
import 'package:joken_po/presentation/home.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Joken Po',
      home: Home(),
    );
  }
}
