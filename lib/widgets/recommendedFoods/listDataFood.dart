import 'dart:async';
import 'package:tesis_project_v1/infrastructure/models/foods.dart';
import 'package:flutter/material.dart';
import 'package:tesis_project_v1/widgets/main.dart';

class ListDataFood extends StatelessWidget {
  const ListDataFood({
    super.key,
    required StreamController<List<Dish>> streamController,
  }) : _streamController = streamController;

  final StreamController<List<Dish>> _streamController;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<Dish>>(
      stream: _streamController.stream,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const NoDataFood();
        } else {
          final dishes = snapshot.data!;
    
          return ListView.builder(
            itemCount: dishes.length,
            itemBuilder: (context, index) {
              final currentDish = dishes[index];                
    
              return ListCard(
                title: currentDish.name,
                caloric: currentDish.caloric,
                fat: currentDish.fat,
                carbon: currentDish.carbon,
                protein: currentDish.protein
              );
            },
          );
        }
      },
    );
  }
}