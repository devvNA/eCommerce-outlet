// ignore_for_file: unnecessary_overrides, invalid_use_of_protected_member, avoid_print
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class ProfilController extends GetxController {
  final token = "".obs;
  final accessToken = "".obs;
  final auth = FirebaseAuth.instance.obs;
  final isTap = false.obs;
  final isVerified = true.obs;
  final overlay = SystemUiOverlayStyle.light.obs;

  @override
  void onInit() {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    getUsername();
    getEmail();
    super.onInit();
  }

  String? getUsername() {
    return auth.value.currentUser?.displayName ?? "Guest";
  }

  String? getEmail() {
    return auth.value.currentUser?.email ?? "Guest";
  }

  isVerifiedTap() {
    isVerified.value = !isVerified();
  }
  // Future<void> onTapGetToken() async {
  //   await Future.delayed(const Duration(milliseconds: 200));
  //   isTap.value = true;
  //   //GET TOKEN
  //   var response1 = await AuthUseCase(
  //           repository: AuthRepositoryImpl(
  //               remoteDataSource: AuthRemoteDataSourceImpl()))
  //       .getFirebaseToken();
  //   response1.fold(
  //       (failure) => log("Error: ${failure.message}"), (t) => token.value = t);
  //   log("Token: ${token.value}");

  //   //GET PROVIDER
  //   var response2 = await AuthUseCase(
  //           repository: AuthRepositoryImpl(
  //               remoteDataSource: AuthRemoteDataSourceImpl()))
  //       .getFirebaseProvider();
  //   response2.fold((failure) => log("Error: ${failure.message}"),
  //       (provider) => log("PROVIDERID = ${provider[0].providerId}"));
  //   isTap.value = false;
  // }

  // Future<void> onTapGetAccessToken() async {
  //   await Future.delayed(const Duration(milliseconds: 200));
  //   isTap(true);
  //   //GET TOKEN
  //   final box = GetStorage();
  //   accessToken.value = box.read("accessToken") ?? "null";
  //   log("ACCESS TOKEN: ${accessToken.value} ");

  //   //GET PROVIDER
  //   var response2 = await AuthUseCase(
  //           repository: AuthRepositoryImpl(
  //               remoteDataSource: AuthRemoteDataSourceImpl()))
  //       .getFirebaseProvider();
  //   response2.fold((failure) => log("Error: ${failure.message}"),
  //       (provider) => log("PROVIDERID = ${provider[0].providerId}"));

  //   isTap(false);
  // }

  @override
  void onClose() {
    super.onClose();
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
  }
}
