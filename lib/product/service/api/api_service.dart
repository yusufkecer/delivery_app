import 'package:rotation_app/product/service/api/api_url.dart';
import 'package:rotation_app/product/service/api/base_service.dart';

import 'package:http/http.dart' as http;

class ApiService implements BaseService {
  String base = ApiUrl.baseUrl;

  @override
  Future<void> delete(String endPoint) async {
    Uri url = Uri.parse(base + endPoint);
    final response = await http.delete(url);
    if (response.statusCode == 200) {
      print(' deleted');
    } else {
      throw Exception('Failed to delete ');
    }
  }

  @override
  Future<void> get(String endPoint) async {
    Uri url = Uri.parse(base + endPoint);
    final response = await http.get(url);
    if (response.statusCode == 200) {
      print('get');
    } else {
      throw Exception('Failed to get');
    }
  }

  @override
  Future<void> update(String endPoint, Map body) async {
    Uri url = Uri.parse(base + endPoint);
    final response = await http.put(url, body: body);
    if (response.statusCode == 200) {
      print('updated');
    } else {
      throw Exception('Failed to update');
    }
  }

  @override
  Future<void> create(String endPoint, Map body) async {
    Uri url = Uri.parse(base + endPoint);
    final response = await http.post(url, body: body);
    if (response.statusCode == 200) {
      print('created');
    } else {
      throw Exception('Failed to create');
    }
  }
}
