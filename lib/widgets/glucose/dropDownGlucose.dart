import 'package:flutter/material.dart';

class DropDownGlucose extends StatefulWidget {
  const DropDownGlucose({super.key});

  @override
  State<DropDownGlucose> createState() => _DropDownGlucoseState();
}

class _DropDownGlucoseState extends State<DropDownGlucose> {

  final items= [
    'Desayuno',
    'Almuerzo',
    'Cena',
  ];
  String? value;

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: Container(
        width: 300,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: Colors.black,
            width: 2
          )
        ),
        child: DropdownButtonHideUnderline(        
          child: DropdownButton<String>(
            value: value,
            icon: const Icon(
              Icons.arrow_drop_down,
              color: Colors.black
            ),
            items: items.map(buildMenuItem).toList(),
            onChanged: (String? newValue) {
              setState(() {
                value= value;
              });
            },  
          ),
        ),
      ),
    );       
  }   
  DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
    value: item,
    child: Text(
      item,
      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
    ),
  ); 
}