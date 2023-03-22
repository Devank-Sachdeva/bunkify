import 'package:bunkify/utils/subject_tile.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DateTime _selectedDay = DateTime.now();
  DateTime _focusedDay = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xff040133),
        body: Column(
          children: [
            TableCalendar(
              firstDay: DateTime.utc(1969),
              lastDay: DateTime.utc(2100),
              focusedDay: _focusedDay,
              calendarFormat: CalendarFormat.week,
              startingDayOfWeek: StartingDayOfWeek.monday,
              onDaySelected: (selectedDay, focusedDay) {
                setState(() {
                  _selectedDay = selectedDay;
                  _focusedDay = focusedDay;
                  // print(_selectedDay);
                });
              },
              onDayLongPressed: (selectedDay, focusedDay) {
                setState(() {
                  if (selectedDay == _selectedDay) {
                    _focusedDay = DateTime.now();
                    _selectedDay = DateTime.now();
                  }
                });
              },
              selectedDayPredicate: (day) {
                return isSameDay(day, _selectedDay);
              },
              headerVisible: true,
              headerStyle: HeaderStyle(
                titleCentered: true,
                titleTextStyle: TextStyle(fontSize: 18.0),
                formatButtonVisible: false,
                formatButtonDecoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(12.0),
                ),
                formatButtonTextStyle: TextStyle(fontSize: 15.0),
                formatButtonShowsNext: true,
                leftChevronIcon: Icon(
                  Icons.chevron_left_rounded,
                  size: 28,
                ),
                rightChevronIcon: Icon(
                  Icons.chevron_right_rounded,
                  size: 28,
                ),
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              itemBuilder: (context, index) => SubjectTile(),
            )
          ],
        ),
      ),
    );
  }
}
