import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class RecommendedFoodsScreen extends StatefulWidget {
  const RecommendedFoodsScreen({super.key});

  @override
  State<RecommendedFoodsScreen> createState() => _RecommendedFoodsScreenState();
}

class _RecommendedFoodsScreenState extends State<RecommendedFoodsScreen> {

  // @override
  // void initState() {
  //   super.initState();
  //   getFoods();
  // }

  // Future<void> getFoods() async {
  //   final response = await Dio().get('https://api.api-ninjas.com/v1/nutrition?query=1lbfries');
  //   response;
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: 1000,
        // shrinkWrap: true,
        itemBuilder: (context, index){
          return Container(
            height: 150,
            color: Colors.primaries[index % Colors.primaries.length],
            child: FittedBox(
              child: Text('Alimento $index'),
            ),
          );
        },
      ),
    );
  }
}