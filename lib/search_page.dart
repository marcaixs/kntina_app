import 'package:flutter/material.dart';
import 'food_grid.dart';

class SearchPage extends StatefulWidget {
  final List foodList;

  const SearchPage({super.key, required this.foodList});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  String query = '';

  @override
  Widget build(BuildContext context) {
    final filteredList = widget.foodList.where((item) {
      final name = item['title'].toString().toLowerCase();
      return name.contains(query.toLowerCase());
    }).toList();

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: TextField(
          decoration: InputDecoration(
            hintText: 'Busca por nombre',
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
            contentPadding: const EdgeInsets.symmetric(horizontal: 12),
          ),
          onChanged: (value) {
            setState(() {
              query = value;
            });
          },
        ),
      ),

      body: query.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/images/search.png', width: 200),
                  Text('¡Encuentra tu próximo plato o gadget!'),
                ],
              ),
            )
          : FoodGrid(foodList: filteredList),
    );
  }
}
