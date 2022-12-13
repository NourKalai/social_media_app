import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

import '../../constant/config.dart';
import '../../models/login-response.model.dart';
import 'package:http/http.dart' as http;

class AuthService {
  Future<LoginResponseModel> login(LoginRequestModel requestModel) async {
    try {
            SharedPreferences sp = await SharedPreferences.getInstance();

      final response = await http.post(
          Uri.parse("http://localhost:3001/user/login"),
          body: requestModel.toJson());
      if (response.statusCode == 200 || response.statusCode == 400) {
        final resData = jsonDecode(response.body);
        print(response);
        return LoginResponseModel.fromJson(
          json.decode(response.body),
        );
      } else {
        throw Exception('Failed to load data!');
      }
    } catch (e) {
      rethrow;
    }
  }
}
