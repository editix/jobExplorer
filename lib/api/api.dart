import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const apiUrl = 'https://www.unhcrjo.org/jobs/api';

  Future<List<Map<String, dynamic>>> fetchVacancies() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      List<dynamic> jsonResponse = json.decode(response.body);
      return jsonResponse.map((job) => job as Map<String, dynamic>).toList();
    } else {
      throw Exception('Failed to load vacancies');
    }
  }
}
