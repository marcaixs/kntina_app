import 'package:flutter/material.dart';
import 'package:kntina_app/features/auth/profile_page.dart';
import 'package:kntina_app/features/cart/presentation/cart_page.dart';
import 'package:kntina_app/features/food/presentation/food_list_page.dart';
import 'package:kntina_app/core/services/food_service.dart';
import 'package:kntina_app/features/food/presentation/search_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List _foodList = [];
  List cartList = [];
  bool _isLoading = true;
  int _selectedIndex = 0;

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

  void addToCart(item) {
    setState(() {
      cartList.add(item);
    });
  }

  List<Widget> get pageOptions => [
    FoodListPage(foodList: _foodList, addToCart: addToCart),
    Text('historial'),
    CartPage(cartList: cartList),
  ];

  void onPageSelected(index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => ProfilePage()));},
            child: CircleAvatar(radius: 18)),
        ),
        title:  Center(
            child: Image.asset('assets/images/logo.png', height: 25),
          ),
        
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.black),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) =>
                      SearchPage(foodList: _foodList, addToCart: addToCart),
                ),
              );
            },
          ),
        ],
      ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : pageOptions.elementAt(_selectedIndex),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          onPageSelected(index);
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.restaurant),
            label: 'Comida',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.inventory_2),
            label: 'Historial',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag),
            label: 'Cesta',
          ),
        ],
      ),
    );
  }
}
