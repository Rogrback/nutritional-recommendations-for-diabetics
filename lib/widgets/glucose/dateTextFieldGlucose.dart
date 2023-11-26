import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:timezone/timezone.dart' as tz;

class DateTextFieldGlucose extends StatefulWidget {
  final controller;
  final String? hintText;
  final bool obscureText;

  const DateTextFieldGlucose({
    super.key,
    required this.controller,
    this.hintText,
    required this.obscureText,
  });

  @override
  State<DateTextFieldGlucose> createState() => _DateTextFieldGlucoseState();
}

class _DateTextFieldGlucoseState extends State<DateTextFieldGlucose> {
  @override
  Widget build(BuildContext context) {

    final timeZoneLima = tz.getLocation('America/Lima');
    final DateTime nowUtc = DateTime.now().toUtc();
    final DateTime nowInLima = tz.TZDateTime.from(nowUtc, timeZoneLima);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: TextField(
        controller: widget.controller,
        obscureText: widget.obscureText,
        readOnly: true,
        decoration: InputDecoration(
          icon: const Icon(Icons.calendar_today),
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
        onTap: () async{
          DateTime? pickedDate = await showDatePicker(
            context: context,
            initialDate: nowInLima,
            firstDate: DateTime(1950),
            lastDate: DateTime(2101),
          );
          if(pickedDate != null){
            final DateTime nowUtc = DateTime.now().toUtc(); 
            var limaLocation = tz.getLocation('America/Lima');
            final DateTime nowLima = tz.TZDateTime.from(nowUtc, limaLocation);
            String formattedDate= DateFormat("dd-MM-yy").format(nowLima);
            setState(() {
              widget.controller.text= formattedDate.toString();
            });
          }else{
            print("Not selected");
          }
        },
      ),
    );
  }
}
