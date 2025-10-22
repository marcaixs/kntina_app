import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:kntina_app/food_card.dart';

class FoodListPage extends StatefulWidget {
  const FoodListPage({super.key});

  @override
  State<FoodListPage> createState() => _FoodListPageState();
}

class _FoodListPageState extends State<FoodListPage> {
  List _foodList = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchFood();
  }

  Future<void> _fetchFood() async {
    final response = await http.get(
      Uri.parse('https://testback.apiabalit.com/kntina/kntina.json'),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      setState(() {
        _foodList = data['data'] as List;
        _isLoading = false;
      });
    } else {
      throw Exception('${response.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : GridView.builder(
              padding: const EdgeInsets.all(12),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 0.75,
              ),
              itemCount: _foodList.length,
              itemBuilder: (context, index) {
                return FoodCard(
                  name: _foodList[index]['title'],
                  image: _foodList[index]['images'][0],
                  price: _foodList[index]['price'].toString(),
                );
              },
            ),
    );
  }
}
