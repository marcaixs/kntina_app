import 'package:flutter/material.dart';
import 'package:kntina_app/food_list_page.dart';
import 'package:kntina_app/food_service.dart';
import 'package:kntina_app/search_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
          child: CircleAvatar(radius: 18),
        ),
        title: Center(child: Image.asset('assets/images/logo.png', height: 25)),
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.black),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => SearchPage(foodList: _foodList),
                ),
              );
            },
          ),
        ],
      ),
      body: _isLoading ? Center(child: CircularProgressIndicator())
      : FoodListPage(foodList: _foodList)
    );
  }
}