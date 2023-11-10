import 'package:flutter/material.dart';

class DdropDownProfile extends StatefulWidget {
  const DdropDownProfile({super.key});

  @override
  State<DdropDownProfile> createState() => _DdropDownProfileState();
}

class _DdropDownProfileState extends State<DdropDownProfile> {

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
  DropdownMenuItem<String> buildMenuItem(String items) => DropdownMenuItem(
    value: items,
    child: Text(
      items,
      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
    ),
  ); 
}