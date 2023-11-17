import 'package:flutter/material.dart';

class DropDownGlucose extends StatefulWidget {

  // String? selectedValue;
  // final List<String> items;
  // final Widget parent;

  const DropDownGlucose({
    super.key,
    // required selectedValue,
    // required this.items,
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
        child: DropdownButton<String>(
          value: value,
          icon: const Icon(
            Icons.arrow_drop_down,
            color: Colors.black
          ),
          items: items.map(buildMenuItem).toList(),
          onChanged: (String? newValue) {
            setState(() {
              // value= value;
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