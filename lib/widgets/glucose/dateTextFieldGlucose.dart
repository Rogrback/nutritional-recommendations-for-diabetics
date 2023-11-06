import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateTextFieldGlucose extends StatefulWidget {
  final controller;
  final String hintText;
  final bool obscureText;

  const DateTextFieldGlucose({
    super.key,
    required this.controller,
    required this.hintText,
    required this.obscureText,
  });

  @override
  State<DateTextFieldGlucose> createState() => _DateTextFieldGlucoseState();
}

class _DateTextFieldGlucoseState extends State<DateTextFieldGlucose> {
  @override
  Widget build(BuildContext context) {
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
            initialDate: DateTime.now(),
            firstDate: DateTime(1950),
            lastDate: DateTime(2101),
          );
          if(pickedDate != null){
            String formattedDate= DateFormat.yMd().format(pickedDate);
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
