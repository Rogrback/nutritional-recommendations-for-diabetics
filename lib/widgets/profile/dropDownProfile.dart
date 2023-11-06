import 'package:flutter/material.dart';

class DropDownProfile extends StatefulWidget {
  const DropDownProfile({super.key});

  @override
  State<DropDownProfile> createState() => _DropDownProfileState();
}

class _DropDownProfileState extends State<DropDownProfile> {

  final items= [
    'Tipo 1',
    'Tipo 2',
    'Gestacional',
    'No sabe',
  ];
  String? value;

  @override
  Widget build(BuildContext context) {
    return  Container(
      width: 300,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Colors.black,
          width: 4
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