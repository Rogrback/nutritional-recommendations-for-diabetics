import 'dart:async';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:http_parser/http_parser.dart' as http;
import 'package:tesis_project_v1/config/constants.dart';
import 'package:tesis_project_v1/infrastructure/models/foods.dart';

class RecommendedFoodsScreen extends StatefulWidget {
  const RecommendedFoodsScreen({super.key});

  @override
  State<RecommendedFoodsScreen> createState() => _RecommendedFoodsScreenState();
}

class _RecommendedFoodsScreenState extends State<RecommendedFoodsScreen> {

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Dio dio = Dio();
  List<String> dishes = [];
  final StreamController<List<Dish>> _streamController = StreamController<List<Dish>>();

  final ApiConfig apiConfig = ApiConfig();

Future<void> fetchData() async {
    try {
      // final response = await dio.get(
      //   apiConfig.apiUrl,
      //   queryParameters: {'name': apiConfig.queryName, 'lang': apiConfig.queryLang},
      //   options: Options(
      //     headers: {
      //       apiConfig.apiHost: apiConfig.host,
      //       apiConfig.apiKey: apiConfig.apiKey,
      //     },
      //   ),
      // );

      final response = await dio.get(
        apiConfig.apiUrl,
        queryParameters: {'name': apiConfig.queryName, 'lang': apiConfig.queryLang},
        options: Options(
          headers: {
            apiConfig.apiHost: apiConfig.host,
            apiConfig.apiKey: apiConfig.key,
          },
        ),
      );

      final Food food = Food.fromJson(response.data);
      _streamController.add(food.dishes);
    } catch (e) {
      print('Error al hacer la solicitud: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<List<Dish>>(
        stream: _streamController.stream,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          } else {
            final dishes = snapshot.data!;

            return ListView.builder(
              itemCount: dishes.length,
              itemBuilder: (context, index) {
                final currentDish = dishes[index];                

                return Card(
                  elevation: 4,
                  margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ListTile(
                  title: Text(
                    currentDish.name.toUpperCase(),
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.black87,
                    ),
                    ),
                  onTap: () {},
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                          'Calorías: ${currentDish.caloric}',
                          style: const TextStyle(fontSize: 16, color: Colors.grey),
                        ),
                        Text(
                          'Grasa: ${currentDish.fat}',
                          style: const TextStyle(fontSize: 16, color: Colors.grey),
                        ),
                        Text(
                          'Carbohidratos: ${currentDish.carbon}',
                          style: const TextStyle(fontSize: 16, color: Colors.grey),
                        ),
                        Text(
                          'Proteínas: ${currentDish.protein}',
                          style: const TextStyle(fontSize: 16, color: Colors.grey),
                        ),
                    ],
                  ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }

  @override
  void dispose() {
    _streamController.close();
    super.dispose();
  }

}