import 'dart:convert';
import 'dart:developer';

import 'package:marvelindo_outlet/app/core/networking/network_request.dart';

import '../../core/api_endpoints.dart';
import '../../data/models/outlet_model.dart';

class UserManager {
  static final UserManager _instance = UserManager._internal();

  factory UserManager() {
    return _instance;
  }

  final request = Request();

  UserManager._internal();

  Outlet? _currentOutlet;

  Outlet? get currentOutlet => _currentOutlet;

  Future<void> loadUserData() async {
    try {
      //permintaan API untuk mendapatkan data
      final response = await request.get(
        loginUrl,
        requiresAuthToken: true,
      );

      if (response.statusCode == 200) {
        // Parsing respons JSON ke dalam objek Outlet
        final jsonData = jsonDecode(response.data);
        _currentOutlet = Outlet.fromJson(jsonData);
      } else {
        // Tangani kesalahan respons
        throw Exception('Failed to load user data');
      }
    } catch (e) {
      // Tangani kesalahan
      log('Error: $e');
    }
  }
}
