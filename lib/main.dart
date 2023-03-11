import 'package:flutter/material.dart';

import 'package:bunkify/view/home_page.dart';

void main() async{
    
    runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(
        useMaterial3: true
      ),
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
