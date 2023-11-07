import 'package:flutter/material.dart';

class RecommendedFoodsScreen extends StatefulWidget {
  const RecommendedFoodsScreen({super.key});

  @override
  State<RecommendedFoodsScreen> createState() => _RecommendedFoodsScreenState();
}

class _RecommendedFoodsScreenState extends State<RecommendedFoodsScreen> {
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