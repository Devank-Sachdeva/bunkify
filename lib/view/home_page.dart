import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    List<Map<int, String>> dates = [
      {14: "Tue"},
      {15: "Wed"},
      {16: "Thu"},
      {17: "Fri"},
      {18: "Sat"}
    ];
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xff040133),
        appBar: AppBar(
          backgroundColor: Color(0xff040133),
          title: Center(child: Text("16 Feb 2023")),
        ),
        // body: Column(children: ListView.builder(itemBuilder: (context, index) {
        //   return ListTile(
        //     subtitle: dates[index],
        //   )
        // })),
      ),
    );
  }
}
