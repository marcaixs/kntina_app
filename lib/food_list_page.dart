import 'package:flutter/material.dart';
import 'package:kntina_app/food_card.dart';
import 'package:kntina_app/food_grid.dart';
import 'package:kntina_app/food_service.dart';

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

  void _fetchFood() async {
  setState(() => _isLoading = true);
  try {
    final data = await FoodService.fetchFood();
    setState(() {
      _foodList = data;
      _isLoading = false;
    });
  } catch (e) {
    setState(() => _isLoading = false);
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            radius: 18,
          ),
        ),
        title: Center(
          child: Image.asset(
            'assets/images/logo.png', 
            height: 25, 
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.black),
            onPressed: () {
            
            },
          ),
        ],
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : Expanded(child: FoodGrid(foodList: _foodList))
    );
  }
}
