// ignore_for_file: unnecessary_overrides, invalid_use_of_protected_member

import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import 'package:marvelindo_outlet/data/datasources/auth_remote_datasources.dart';
import 'package:marvelindo_outlet/data/repositories/auth_repository_impl.dart';
import 'package:marvelindo_outlet/domain/usecase/auth_usecase.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilController extends GetxController {
  AuthCredential? credential;

  final token = "".obs;
  final accessToken = "".obs;
  final auth = FirebaseAuth.instance.obs;
  final isTap = false.obs;

  @override
  void onInit() {
    getUsername();
    getEmail();
    getDisplayProfile();

    super.onInit();
  }

  String? getUsername() {
    return auth.value.currentUser?.displayName ?? "Invalid";
  }

  String? getEmail() {
    return auth.value.currentUser?.email ?? "Invalid";
  }

  String? getDisplayProfile() {
    return auth.value.currentUser?.photoURL ??
        "https://media.istockphoto.com/id/1289670343/vector/invalid-stamp-invalid-label-round-grunge-sign.jpg?s=612x612&w=0&k=20&c=p654_tY0_Nd5N0yYbE9aNJpblSykywX9nw0g_fe4D5k=";
  }

  Future<void> onTapGetToken() async {
    await Future.delayed(const Duration(milliseconds: 200));
    isTap.value = true;
    //GET TOKEN
    var response1 = await AuthUseCase(
            repository: AuthRepositoryImpl(
                remoteDataSource: AuthRemoteDataSourceImpl()))
        .getFirebaseToken();
    response1.fold(
        (failure) => log("Error: ${failure.message}"), (t) => token.value = t);
    log("Token: ${token.value}");

    //GET PROVIDER
    var response2 = await AuthUseCase(
            repository: AuthRepositoryImpl(
                remoteDataSource: AuthRemoteDataSourceImpl()))
        .getFirebaseProvider();
    response2.fold((failure) => log("Error: ${failure.message}"),
        (provider) => log("PROVIDERID = ${provider[0].providerId}"));
    isTap.value = false;
  }

  Future<void> onTapGetAccessToken() async {
    await Future.delayed(const Duration(milliseconds: 200));
    isTap.value = true;
    //GET TOKEN
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    accessToken.value = prefs.getString("accessToken").toString();
    log("ACCESS TOKEN BUTTON: ${prefs.getString("accessToken")}");

    isTap.value = false;
  }
}
