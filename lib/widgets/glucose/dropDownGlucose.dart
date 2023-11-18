import 'package:flutter/material.dart';

class DropDownGlucose extends StatefulWidget {

  final String dropdownValue;
  final List<String> list;
  final Function(String?)? onChanged = null;

  const DropDownGlucose({
    super.key,
    required this.dropdownValue,
    required this.list,
    required onChanged
  });
  
  @override
  State<DropDownGlucose> createState() => _DropDownGlucoseState();
}

class _DropDownGlucoseState extends State<DropDownGlucose> {
  String value = "Desayuno";
  var items = [
    "Desayuno",
    "Almuerzo",
    "Cena"
  ];

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
        child: DropdownButton(
          value: widget.dropdownValue,
          items: widget.list.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          // items: [
          //   DropdownMenuItem(value: 'Desayuno', child: Text('Desayuno')),
          //   DropdownMenuItem(value: 'Almuerzo', child: Text('Almuerzo')),
          //   DropdownMenuItem(value: 'Cena', child: Text('Cena')),
          // ],
          // onChanged: (String? value) {
          //   setState(() {
          //     widget.dropdownValue = value!;
          //     print(value);
          //   });
          // },
          onChanged: widget.onChanged,          
        )
      ),
    );       
  }  

  // DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
  //   value: item,
  //   child: Text(
  //     item,
  //     style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
  //   ),
  // ); 

  String dropdown = "Desayuno";

  // @override
  // Widget build(BuildContext context) {
  //   return DropdownButton(
  //     value: widget.selectedValue,
  //     items: widget.items.map((String items) {
  //       return DropdownMenuItem(
  //         value: items,
  //         child: Text(
  //           items,
  //           style: const TextStyle(
  //             fontSize: 28,
  //             fontWeight: FontWeight.bold
  //           ),
  //         ),
  //       );
  //     }).toList(), onChanged: (String? newValue) {
  //       setState(() {
  //         widget.selectedValue = newValue!;
  //       });
  //     },
  //   );
  // }
}