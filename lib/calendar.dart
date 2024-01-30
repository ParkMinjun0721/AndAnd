import 'package:andand/util/color.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';

class CalendarPage extends StatefulWidget {
  @override
  _CalendarPageState createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  @override
  Widget build(BuildContext context) {
    // Set initial selected day to today if it's not already set
    if (_selectedDay == null) {
      _selectedDay = DateTime.now();
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Calendar',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            TableCalendar(
              firstDay: DateTime.utc(2021, 1, 1),
              lastDay: DateTime.utc(2030, 12, 31),
              focusedDay: _focusedDay,
              calendarFormat: _calendarFormat,
              onFormatChanged: (format) {
                setState(() {
                  _calendarFormat = format;
                });
              },
              onDaySelected: (selectedDay, focusedDay) {
                setState(() {
                  _selectedDay = selectedDay;
                  _focusedDay = focusedDay;
                });
              },
              selectedDayPredicate: (day) {
                return isSameDay(_selectedDay, day);
              },
              availableCalendarFormats: {
                CalendarFormat.week: 'month',
                CalendarFormat.month: 'week',
              },
              headerStyle: HeaderStyle(
                titleTextStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                ),
                formatButtonTextStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 12.0,
                ),
              ),
              calendarStyle: CalendarStyle(
                selectedDecoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color.fromARGB(255, 184, 219, 198),
                ),
                selectedTextStyle: TextStyle(color: Colors.white),
                todayDecoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.black,
                ),
                todayTextStyle: TextStyle(color: Colors.white),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.width * 0.045),
            Divider(
              color: Colors.black,
              height: 1.0,
              indent: 16.0,
              endIndent: 16.0,
            ),
            SizedBox(height: MediaQuery.of(context).size.width * 0.025),
            if (_selectedDay != null)
              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(left: 16.0),
                child: Text(
                  '${DateFormat('yyyy-MM-dd').format(_selectedDay!)}',
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.width * 0.015),
            if (_selectedDay != null)
              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(left: 16.0),
                child: RichText(
                  text: TextSpan(
                    style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                    children: [
                      TextSpan(
                        text: '그 날의 추억:  ',
                      ),
                      TextSpan(
                        text: '#웃음',
                        style: TextStyle(color: lightColorScheme.primary),
                      ),
                    ],
                  ),
                ),
              ),
            Container(
              padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.05),
              child: GridView.builder(
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: MediaQuery.of(context).size.width * 0.045,
                  mainAxisSpacing: MediaQuery.of(context).size.width * 0.045,
                ),
                itemCount: 2,
                itemBuilder: (context, index) {
                  return Image.network('https://via.placeholder.com/150');
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  bool isSameDay(DateTime? a, DateTime b) {
    return a?.year == b.year && a?.month == b.month && a?.day == b.day;
  }
}
