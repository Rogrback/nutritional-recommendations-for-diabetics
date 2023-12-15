import 'dart:async';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:tesis_project_v1/config/constants.dart';
import 'package:tesis_project_v1/infrastructure/models/foods.dart';
import 'package:tesis_project_v1/widgets/main.dart';

class RecommendedFoodsScreen extends StatefulWidget {
  const RecommendedFoodsScreen({super.key});

  @override
  State<RecommendedFoodsScreen> createState() => _RecommendedFoodsScreenState();
}

class _RecommendedFoodsScreenState extends State<RecommendedFoodsScreen> {

  final _foodController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  Dio dio = Dio();
  List<String> dishes = [];
  final StreamController<List<Dish>> _streamController = StreamController<List<Dish>>();
  final ApiConfig apiConfig = ApiConfig();

  Future<void> fetchData(String food) async {
    try {
      final response = await dio.get(
        apiConfig.apiUrl,
        queryParameters: {'name': food, 'lang': apiConfig.queryLang},
        options: Options(
          headers: {
            apiConfig.apiHost: apiConfig.host,
            apiConfig.apiKey: apiConfig.key,
          },
        ),
      );

      final Food foodData = Food.fromJson(response.data);
      _streamController.add(foodData.dishes);
    } catch (e) {
      print('Error al hacer la solicitud: $e');
    }
  }

  void searchFood() {
    String searchText = _foodController.text;
    fetchData(searchText);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 10),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 17),
            child: Row(
              children: [
                Expanded(
                  flex: 3,
                  child: SearchTextField(
                    controller: _foodController,
                    obscureText: false,
                  ),              
                ),
                const SizedBox(width: 5),
                Expanded(
                  flex: 1,
                  child: SearchButton(
                    onPressed: searchFood,
                    text: 'Buscar'
                  )
                ),
                const SizedBox(width: 15),
              ],
            ),
          ),
          // const SizedBox(height: 30),
          Divider(height: 10, color: Colors.green[800]),
          Expanded(
            child: ListDataFood(streamController: _streamController)
          )
        ],
      )
    );
  }

  @override
  void dispose() {
    _streamController.close();
    super.dispose();
  }

}

