import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:timezone/timezone.dart' as tz;

class TimeTextFieldGlucose extends StatefulWidget {

  final controller;
  final bool obscureText;
  final String? hintText;
  
  const TimeTextFieldGlucose({
    super.key,
    required this.controller,
    required this.obscureText,
    this.hintText,
  });

  @override
  State<TimeTextFieldGlucose> createState() => _TimeTextFieldGlucoseState();
}

class _TimeTextFieldGlucoseState extends State<TimeTextFieldGlucose> {

  @override
  Widget build(BuildContext context) {

  var timeZoneLima = tz.getLocation('America/Lima');
  DateTime nowUtc = DateTime.now().toUtc();
  DateTime nowInLima = tz.TZDateTime.from(nowUtc, timeZoneLima);

  String formatTime(TimeOfDay time) {
    DateTime nowUtc = DateTime.now().toUtc();
    var limaLocation = tz.getLocation('America/Lima');
    DateTime nowLima = tz.TZDateTime.from(nowUtc, limaLocation);
  
    DateTime selectedDateTime = DateTime(
      nowLima.year,
      nowLima.month,
      nowLima.day,
      time.hour,
      time.minute,
    );
  
    return DateFormat("hh:mm a").format(selectedDateTime);
  }

  void showTime() async {
    TimeOfDay timeInLima = TimeOfDay(hour: nowInLima.hour, minute: nowInLima.minute);
    TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: timeInLima,
    );

    if (pickedTime != null) {
      String formattedTime = formatTime(pickedTime);
      setState(() {
        widget.controller.text = formattedTime;
      });
    }
  }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: TextField(
        controller: widget.controller,
        obscureText: widget.obscureText,
        readOnly: true,
        decoration: InputDecoration(
          icon: const Icon(Icons.access_alarm),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade400),
          ),
          fillColor: Colors.grey.shade200,
          filled: true,
          hintText: widget.hintText,
          hintStyle: TextStyle(color: Colors.grey[500])
        ),
        onTap: () {
          showTime();
        },
      ),
    );
  }
}