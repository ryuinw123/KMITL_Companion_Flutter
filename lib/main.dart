import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ui_base/core/viewmodels/home_model.dart';
import 'package:ui_base/ui/views/home_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (context) => HomeModel(),
      child : const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomeView(),
      ),
    );
  }
}


