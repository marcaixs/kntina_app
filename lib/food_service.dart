import 'package:http/http.dart' as http;
import 'dart:convert';

class FoodService {
  static const String url = 'https://testback.apiabalit.com/kntina/kntina.json';

  static Future<List> fetchFood() async {
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data['data'] as List;
    } else {
      throw Exception('${response.statusCode}');
    }
  }
}