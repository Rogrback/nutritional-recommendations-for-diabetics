import 'package:flutter/material.dart';

class DropDownProfile extends StatelessWidget {

  // DropDownProfile() {
  //   selectedValue = list[0];  
  // }


  final String selectedValue;
  final List listItems;
  final Widget? text;

  const DropDownProfile({
    super.key,
    required this.selectedValue,
    required this.text,
    required this.listItems
  });

  @override
  Widget build(BuildContext context) {

    // List listn = ['1', '2', '3', '4', '5']; 

    return DropdownButton(
      hint: text,
      icon: const Icon(Icons.arrow_drop_down),      
      items: listItems.map((e) {
        return DropdownMenuItem(
          value: e,
          child: Text(e),
        );
      }).toList(),
      onChanged:(value) {
        
      },
    );
  }
}