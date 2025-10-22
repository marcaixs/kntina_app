import 'package:flutter/material.dart';
import 'package:kntina_app/food_card.dart';
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
