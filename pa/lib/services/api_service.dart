import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl = "https://52392af06326.ngrok-free.app/api";
  
  Future<Map<String, dynamic>> predictImage(File imageFile) async {
    final Uri url = Uri.parse('$baseUrl/predict-image/');

    final request = http.MultipartRequest('POST', url);

    final imageBytes = await imageFile.readAsBytes();
    final multipartFile = http.MultipartFile.fromBytes(
      'image',
      imageBytes,
      filename: imageFile.path.split('/').last,
    );
    request.files.add(multipartFile);

    try {
      final streamedResponse = await request.send();
      final response = await http.Response.fromStream(streamedResponse);

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = json.decode(response.body);
        
        if (responseData['prediction'] != null) {
          return responseData['prediction'];
        } else {
          throw Exception('Invalid response format from server');
        }
      } else {
        final errorData = json.decode(response.body);
        throw Exception(errorData['error'] ?? 'Unknown server error');
      }
    } catch (e) {
      // Tambahkan print untuk debugging jika perlu
      print('Error during API call: $e');
      throw Exception('Failed to connect to the server. Please check your connection.');
    }
  }
}