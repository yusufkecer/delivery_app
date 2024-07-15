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
      print(' deleted');
    } else {
      throw Exception('Failed to delete ');
    }
  }

  Future<List> get(String endPoint) async {
    try {
      Uri url = Uri.parse(base + endPoint);
      // Logger().w(url);

      var response = await http.get(url);
      return jsonDecode(response.body);
      // if (response.statusCode == 200) {
      //   List data = jsonDecode(response.body);
      //   return data;
      // } else {
      //   throw Exception('Failed to get');
      // }
    } catch (e) {
      print("error");
      Logger().e(e);
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
