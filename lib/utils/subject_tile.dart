import 'package:flutter/material.dart';

class SubjectTile extends StatelessWidget {
  const SubjectTile({super.key});
  // final String day;
  // final String date;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        leading: Icon(Icons.check_circle_rounded),
        title: Text("DBMS"),
        trailing: Icon(Icons.menu),
      ),
    );
  }
}
