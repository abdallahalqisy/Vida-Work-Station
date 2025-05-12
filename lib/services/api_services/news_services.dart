// fetch news from api

import 'package:dio/dio.dart';
import 'package:vida/models/news_model.dart';
import 'package:vida/services/constant/api_uri.dart';

class NewaServices {
  Future<List<Welcome>> fetchNews() async {
    try {
      final response = await Dio().get('$baseUrl/News');

      if (response.statusCode == 200) {
        print(response.data);

        return (response.data as List).map((e) => Welcome.fromJson(e)).toList();
      } else {
        throw Exception('Failed to load space: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to fetch space: $e');
    }
  }
}
