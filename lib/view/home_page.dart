import 'package:bunkify/data/database_handler.dart';
import 'package:bunkify/models/data_models/subject.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // void createObject() async{
  //   DatabaseHandler handler = await DatabaseHandler.create();
  // }

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  // }
  TextEditingController controller = TextEditingController();
  String? userValue;
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
        body: Column(children: [
          TextField(
            controller: controller,
            onChanged: (value) => userValue = value,
          ),
          ElevatedButton(
              onPressed: () async {
                DatabaseHandler handler = await DatabaseHandler.create();
                SubjectData data = SubjectData(
                    name: userValue ?? " ", type: "Lecture", id: "01");
                handler.createSubjectTable(data);
                controller.clear();
              },
              child: Text("Add"))
        ]),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            DatabaseHandler handler = await DatabaseHandler.create();
            handler.viewDataBase();
          },
          child: const Icon(Icons.add),
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
