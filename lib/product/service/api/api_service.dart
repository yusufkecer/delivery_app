import 'dart:convert';

import 'package:rotation_app/core/extension/logger_extension.dart';
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
      "deleted".logInfo;
    } else {
      throw Exception('Failed to delete ');
    }
  }

  @override
  Future<List> get(String endPoint) async {
    try {
      Uri url = Uri.parse(base + endPoint);

      var response = await http.get(url);
      if (response.statusCode == 200) {
        List data = jsonDecode(response.body);
        return data;
      } else {
        "Failed to get".logError;
        throw Exception('Failed to get');
      }
    } catch (e) {
      "error: $e".logError;
      throw Exception('Failed to get');
    }
  }

  @override
  Future<Map> update(String endPoint, Map body, String id) async {
    Uri url = Uri.parse("$base$endPoint/$id");

    "request $endPoint".logInfo;
    final response = await http.put(url, body: body);

    if (response.statusCode == 200) {
      return {
        'statusCode': 200,
        'status': 'success',
      };
    } else {
      'Failed to update'.logInfo;
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
      'created'.logInfo;
    } else {
      throw Exception('Failed to create');
    }
  }
}
