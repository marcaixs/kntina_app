import 'package:flutter/material.dart';
import 'package:kntina_app/features/food/widgets/food_grid.dart';

class FoodListPage extends StatefulWidget {
  final List foodList;
  final Function addToCart;

  const FoodListPage({super.key, required this.foodList, required this.addToCart});

  @override
  State<FoodListPage> createState() => _FoodListPageState();
}

class _FoodListPageState extends State<FoodListPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late List _foodList;

  @override
  void initState() {
    super.initState();
    _foodList = widget.foodList;
    _tabController = TabController(length: 4, vsync: this);
  }

  List _filterByCategory(String category) {
    if (category == 'Todo') return _foodList;
    return _foodList
        .where((item) => item['category']['name'].toString().contains(category)).toList();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TabBar(
          controller: _tabController,
          indicatorColor: Colors.green[800],
          labelColor: Colors.green[800],
          unselectedLabelColor: Colors.black,
          tabs: [
            Tab(icon: Icon(Icons.restaurant_menu), text: 'Todo'),  
            Tab(icon: Icon(Icons.ramen_dining), text: 'Pasta'),     
            Tab(icon: Icon(Icons.eco), text: 'Verduras'),         
            Tab(icon: Icon(Icons.set_meal_outlined), text: 'Pescado'), 
          ],
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: TabBarView(controller: _tabController, children: [
            FoodGrid(
              foodList: _filterByCategory('Todo'),
              addToCart: widget.addToCart,
            ),
                     FoodGrid(
              foodList: _filterByCategory('Pasta'),
              addToCart: widget.addToCart,
            ),
            FoodGrid(
              foodList: _filterByCategory('Verduras'),
              addToCart: widget.addToCart,
            ),
            FoodGrid(
              foodList: _filterByCategory('Pescado'),
              addToCart: widget.addToCart,
            ),
                    ]),
          )
        ),
      ],
    );
  }
}
