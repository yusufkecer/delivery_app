import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:rotation_app/core/extension/logger_extension.dart';
import 'package:rotation_app/product/service/api/api_key.dart';
import 'package:rotation_app/product/service/api/api_url.dart';
import 'package:rotation_app/product/service/api/base_service.dart';
import 'package:http/http.dart' as http;

@immutable
final class ApiService implements BaseService {
  final String base = ApiUrl.baseUrl;

  @override
  Future<void> delete(String endPoint) async {
    final Uri url = Uri.parse(base + endPoint);
    final response = await http.delete(url);
    if (response.statusCode == 200) {
      "deleted".info;
    } else {
      throw Exception('Failed to delete ');
    }
  }

  @override
  Future<List> get(String endPoint) async {
    try {
      final Uri url = Uri.parse(base + endPoint);

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
    final Uri url = Uri.parse("$base$endPoint/$id");

    final response = await http.put(url, body: body);
    if (response.statusCode == 200) {
      return {
        'statusCode': 200,
        'status': 'success',
      };
    } else {
      'Failed to update'.info;
      return {
        'statusCode': response.statusCode,
        'status': "error",
      };
    }
  }

  @override
  Future<void> create(String endPoint, Object body) async {
    final Uri url = Uri.parse(base + endPoint);
    final response = await http.post(url, body: body);
    if (response.statusCode == 200) {
      'created'.info;
    } else {
      throw Exception('Failed to create');
    }
  }

  @override
  Future getDirections(String start, String end) async {
    const String baseUrl = ApiUrl.directionsUrl;
    const String apiKey = APIKey.openRouteApiKey;
    final Uri uri = Uri.parse('$baseUrl?start=$start&end=$end&apiKey=$apiKey');

    try {
      final response = await http.get(uri, headers: {"Authorization": "Bearer $apiKey"});

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = jsonDecode(response.body);
        final List route = data["features"].first["geometry"]["coordinates"];
        ' $route  '.info;
        return route;
      } else {
        final String errorMessage = jsonDecode(response.body)['error'] ?? 'Unknown error';
        'Failed to get route: $errorMessage'.logError("ApiService");
      }
    } catch (e) {
      'Error: $e'.logError("ApiService");
    }
  }
}
