import 'dart:async';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:marvelindo_outlet/app/core/networking/network_request.dart';

class TokenRefresherController extends GetxController {
  final request = Request();

  Timer? _timer;
  DateTime? _lastRefreshTime;

  @override
  void onInit() {
    super.onInit();
    startRefreshing();
  }

  void startRefreshing() {
    _refreshToken(); // Refresh token segera saat memulai
    _timer = Timer.periodic(
        const Duration(seconds: 15), (_) => _checkAndRefreshToken());
  }

  void _checkAndRefreshToken() {
    final now = DateTime.now();
    if (_lastRefreshTime == null ||
        now.difference(_lastRefreshTime!).inSeconds >= 115) {
      _refreshToken();
    }
  }

  Future<void> _refreshToken() async {
    try {
      final result = await request.refreshToken();
      _lastRefreshTime = DateTime.now();
      log('Token berhasil diperbarui: $result');
    } catch (e) {
      log('Terjadi kesalahan saat memperbarui token: $e');
    }
  }

  @override
  void onClose() {
    _timer?.cancel();
    super.onClose();
  }
}
