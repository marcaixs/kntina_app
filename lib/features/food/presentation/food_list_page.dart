import 'package:flutter/material.dart';
import 'package:kntina_app/features/food/widgets/food_grid.dart';

class FoodListPage extends StatefulWidget {
  final List foodList; 

  const FoodListPage({super.key, required this.foodList});

  @override
  State<FoodListPage> createState() => _FoodListPageState();
}

class _FoodListPageState extends State<FoodListPage> {
  List _foodList = []; 
  List _filteredList = [];

  @override
  void initState() {
    super.initState();
    _foodList = widget.foodList;
    _filteredList = _foodList;
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
    return  Column(
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
         
          Expanded(child: FoodGrid(foodList: _filteredList)),
        ],
      );
  }
}
