import 'package:flutter/material.dart';
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

  void addToCart(item){
    setState(() {
      cartList.add(item);
    });
  }

  Widget _buildBody() {
    if (_isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    switch (_selectedIndex) {
      case 0:
        return FoodListPage(foodList: _foodList, addToCart: addToCart,);
      case 1:
        return Text('historial'); //todo: afegir pages
      case 2:
        return CartPage(cartList: cartList,);
      default:
        return const SizedBox.shrink();
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
                  builder: (_) => SearchPage(foodList: _foodList, addToCart: addToCart),
                ),
              );
            },
          ),
        ],
      ),
      body: _buildBody(),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
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
