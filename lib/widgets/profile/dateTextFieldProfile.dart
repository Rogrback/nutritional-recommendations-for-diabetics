import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateTextFieldProfile extends StatefulWidget {
  final controller;
  final String? hintText;
  final bool obscureText;

  const DateTextFieldProfile({
    super.key,
    required this.controller,
    this.hintText,
    required this.obscureText,
  });

  @override
  State<DateTextFieldProfile> createState() => _DateTextFieldProfileState();
}

class _DateTextFieldProfileState extends State<DateTextFieldProfile> {
  @override
  Widget build(BuildContext context) {
    return TextField(
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
      );
  }
}
