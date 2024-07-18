import 'dart:convert';
import 'package:logger/logger.dart';
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
      Logger().i('deleted');
    } else {
      throw Exception('Failed to delete ');
    }
  }

  @override
  Future<List> get(String endPoint) async {
    try {
      Uri url = Uri.parse(base + endPoint);
      // Logger().w(url);

      var response = await http.get(url);
      if (response.statusCode == 200) {
        List data = jsonDecode(response.body);
        return data;
      } else {
        Logger().e('Failed to get', error: "${response.statusCode} ${response.body}");
        throw Exception('Failed to get');
      }
    } catch (e) {
      Logger().e("Error $e");
      throw Exception('Failed to get');
    }
  }

  @override
  Future<Map> update(String endPoint, Map body, String id) async {
    Uri url = Uri.parse("$base$endPoint/$id");
    Logger().i("request $endPoint", error: body);

    final response = await http.put(url, body: body);

    if (response.statusCode == 200) {
      return {
        'statusCode': 200,
        'status': 'success',
      };
    } else {
      Logger().e('Failed to update', error: "${response.statusCode} ${response.body}");
      return {
        'statusCode': response.statusCode,
        'status': "error",
      };
    }
  }

  @override
  Future<void> create(String endPoint, Object body) async {
    Uri url = Uri.parse(base + endPoint);
    final response = await http.post(url, body: body);
    if (response.statusCode == 200) {
      Logger().i('created');
    } else {
      throw Exception('Failed to create');
    }
  }
}
