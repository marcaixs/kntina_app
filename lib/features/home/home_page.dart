import 'package:flutter/material.dart';
import 'package:kntina_app/features/orders/presentation/orders_page.dart';
import 'package:kntina_app/features/profile/profile_page.dart';
import 'package:kntina_app/features/cart/presentation/cart_page.dart';
import 'package:kntina_app/features/food/presentation/food_list_page.dart';
import 'package:kntina_app/core/services/food_service.dart';
import 'package:kntina_app/features/food/presentation/search_page.dart';
import 'package:kntina_app/user.dart';

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
    bool itemExists = cartList.any((cartItem) => cartItem['id'] == item['id']);

    if (!itemExists) {
      setState(() {
        Map<String, dynamic> cartItem = Map<String, dynamic>.from(item);
        cartItem['quantity'] = 1;
        cartList.add(cartItem);
      });
    }
  }

  void updateCartItemQuantity(int itemId, int newQuantity) {
    setState(() {
      int index = cartList.indexWhere((cartItem) => cartItem['id'] == itemId);
      if (index != -1) {
        if (newQuantity <= 0) {
          cartList.removeAt(index);
        } else {
          cartList[index]['quantity'] = newQuantity;
        }
      }
    });
  }

  void removeFromCart(int itemId) {
    setState(() {
      cartList.removeWhere((cartItem) => cartItem['id'] == itemId);
    });
  }

  void completeOrder() {
    if (cartList.isEmpty) return;

    double totalPrice = 0;
    for (var item in cartList) {
      totalPrice += (item['price'] ?? 0).toDouble() * (item['quantity'] ?? 1);
    }

    final newOrder = {
      "id":
          "KH${DateTime.now().millisecondsSinceEpoch.toString().substring(8)}",
      "date":
          "${DateTime.now().day} de ${_getMonthName(DateTime.now().month)} de ${DateTime.now().year}",
      "price": totalPrice,
      "status": "en camino",
      "products": cartList
          .map(
            (item) => {
              "id": item['id'],
              "images": item['images'],
              "title": item['title'],
              "description": item['description'],
              "price": item['price'],
              "category": item['category'],
              "quantity": item['quantity'] ?? 1,
            },
          )
          .toList(),
    };

    setState(() {
      testUser.orderHistory.insert(0, newOrder);
      cartList.clear();
    });
  }

  String _getMonthName(int month) {
    const months = [
      'enero',
      'febrero',
      'marzo',
      'abril',
      'mayo',
      'junio',
      'julio',
      'agosto',
      'septiembre',
      'octubre',
      'noviembre',
      'diciembre',
    ];
    return months[month - 1];
  }

  List<Widget> get pageOptions => [
    FoodListPage(foodList: _foodList, addToCart: addToCart),
    OrdersPage(orderList: testUser.orderHistory),
    CartPage(
      cartList: cartList,
      updateQuantity: updateCartItemQuantity,
      removeItem: removeFromCart,
      completeOrder: completeOrder,
    ),
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
                MaterialPageRoute(builder: (_) => ProfilePage()),
              );
            },
            child: CircleAvatar(
              radius: 18,
              backgroundImage: AssetImage(testUser.profileImage),
            ),
          ),
        ),
        title: Center(child: Image.asset('assets/images/logo.png', height: 25)),

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