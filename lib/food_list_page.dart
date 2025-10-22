import 'package:flutter/material.dart';
import 'package:kntina_app/food_grid.dart';
import 'package:kntina_app/food_service.dart';
import 'package:kntina_app/search_page.dart';

class FoodListPage extends StatefulWidget {
  const FoodListPage({super.key});

  @override
  State<FoodListPage> createState() => _FoodListPageState();
}

class _FoodListPageState extends State<FoodListPage> {
  List _foodList = [];
  List _filteredList = [];
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
        _filteredList = _foodList;
        _isLoading = false;
      });
    } catch (e) {
      setState(() => _isLoading = false);
    }
  }

  void filterContent(String categoryInput) {
    List filteredContent = _foodList.where((item) {
      final categoryName = item['category']['name'];
      return categoryName.contains(categoryInput);
    }).toList();

    setState(() {
      _filteredList = filteredContent;
    });
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
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  IconButton(
                    onPressed: () {
                      setState(() {
                        _filteredList = _foodList;
                      });
                    },
                    icon: Icon(Icons.local_dining, color: Colors.black),
                  ),
                  Text('Todo')
                ],
              ),
              Column(
                children: [
                  IconButton(
                    onPressed: () {
                      filterContent('Pasta');
                    },
                    icon: Icon(Icons.dining_sharp, color: Colors.black),
                  ),
                  Text('Pasta')
                ],
              ),
              Column(
                children: [
                  IconButton(
                    onPressed: () {
                      filterContent('Verduras');
                    },
                    icon: Icon(Icons.dining_sharp, color: Colors.black),
                  ),
                  Text('Verduras')
                ],
              ),
              Column(
                children: [
                  IconButton(
                    onPressed: () {
                      filterContent('Pescado');
                    },
                    icon: Icon(Icons.dining_sharp, color: Colors.black),
                  ),
                  Text('Pescado')
                ],
              ),
            ],
          ),
          _isLoading
              ? const Center(child: CircularProgressIndicator())
              : Expanded(child: FoodGrid(foodList: _filteredList)),
        ],
      ),
    );
  }
}
