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

  void _showTimePicker() async{    
    TimeOfDay timeInLima= TimeOfDay(hour: nowInLima.hour, minute: nowInLima.minute);
    TimeOfDay? picketTime = await showTimePicker(
      context: context,
      initialTime: timeInLima
    );
    if(picketTime != null){
      final DateTime nowUtc = DateTime.now().toUtc();
      int hour = picketTime.hour;        
      int minute = picketTime.minute;     
      var limaLocation = tz.getLocation('America/Lima');
      final DateTime nowLima = tz.TZDateTime.from(nowUtc, limaLocation);
      String formattedDate= DateFormat("hh:mm a").format(nowLima);
      setState(() {
        widget.controller.text= formattedDate.toString();
      });
      }else{
        print("Not selected");
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
          _showTimePicker();
          print('hika');
        },
      ),
    );
  }
}