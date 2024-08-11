// ignore_for_file: unnecessary_overrides, invalid_use_of_protected_member, avoid_print, unused_local_variable
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:marvelindo_outlet/app/data/datasources/auth_remote_datasources.dart';
class ProfilController extends GetxController {
  // final token = "".obs;
  // final accessToken = "".obs;
  // final auth = FirebaseAuth.instance;
  // final isTap = false.obs;
  final outlet = UserManager().currentOutlet;

  @override
  void onInit() {
    getUsername();
    getEmail();
    getDisplayProfile();

    super.onInit();
  }

  String? getUsername() {
    return outlet?.namaOutlet ?? "Guest";
  }

  String? getEmail() {
    return outlet?.email ?? "Guest";
  }

  String? getDisplayProfile() {
    return "https://media.istockphoto.com/id/1327592506/vector/default-avatar-photo-placeholder-icon-grey-profile-picture-business-man.jpg?s=612x612&w=0&k=20&c=BpR0FVaEa5F24GIw7K8nMWiiGmbb8qmhfkpXcp1dhQg=";
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

  @override
  void onClose() {
    super.onClose();
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
  }
}
