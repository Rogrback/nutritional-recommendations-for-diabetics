import 'package:flutter/material.dart';

class ButtonNumericProfile extends StatefulWidget {

  // final controller;
  // final String hintText;

  const ButtonNumericProfile({
    super.key,
    // required this.controller,
    // required this.hintText,
  });

  @override
  State<ButtonNumericProfile> createState() => _ButtonNumericProfileState();
}

class _ButtonNumericProfileState extends State<ButtonNumericProfile> {

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            child: const Text('Boton Numerico'),
            onPressed: () {
              _alertNumeric(context);
            }
          )
        ],
      ),
    );
  }

  Widget rowNumeric({int? text1=0, int? text2=0, int? text3=0, controller, hintText}) {
    // if(text1==0) text1=1;
    // if(text2==0) text2=1;
    // if(text3==0) text3=1;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [      
        ElevatedButton(
          onPressed: () {
            print(text1);
          },
          child: Text(text1.toString()),
        ),
        ElevatedButton(
          onPressed: () {
            print(text2);
          },
          child: Text(text2.toString()),
        ),
        ElevatedButton(
          onPressed: () {
            print(text3);
          },
          child: Text(text3.toString()),
        )
      ],
    );
  }

  void _alertNumeric(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        // title: const Text('Title'),
        content: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.min,          
          children: [
          const SizedBox(height: 10),
          TextField(
              // controller: controller,
              decoration: InputDecoration(
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.shade400),
                ),
                fillColor: Colors.grey.shade200,
                filled: true,
                // hintText: hintText,
                hintStyle: TextStyle(color: Colors.grey[500])
              ),
          ), 
          const SizedBox(height: 30),
          rowNumeric(text1: 1, text2: 2, text3: 3),
          const SizedBox(height: 30),
          rowNumeric(text1: 4, text2: 5, text3: 6),
          const SizedBox(height: 30),
          rowNumeric(text1: 7, text2: 8, text3: 9),
          const SizedBox(height: 30),
          // rowNumeric(text2: 0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  print('0');
                },
                child: Text('0'),
              )
            ],
          ),
        ]
        ),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextButton(
              child: const Text('Cancelar'),
              onPressed: () {
              Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Aceptar'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            ],
          ),          
        ],
      )
    );
  }
}