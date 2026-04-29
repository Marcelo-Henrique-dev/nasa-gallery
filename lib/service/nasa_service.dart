import 'dart:convert';
import 'package:http/http.dart' as http;

class NasaService {
  Future<List<dynamic>> searchImages(String query) async {
    final url = Uri.parse(
      'https://images-api.nasa.gov/search?q=$query&media_type=image'
    );

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return data['collection']['items'] ?? [];
      } else {
        throw Exception('Erro na API: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Falha na requisição: $e');
    }
  }
}