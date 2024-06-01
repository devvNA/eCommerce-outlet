// ignore_for_file: override_on_non_overriding_member

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../core/networking/firebase_auth_services.dart';
import '../../../core/networking/network_request.dart';
import '../../modules/about/controllers/about_app_controller.dart';
import '../../modules/api_test/api_test_controller.dart';
import '../../modules/api_test/detail_api/detail_api_controller.dart';
import '../../modules/auth/login/controller/login_controller.dart';
import '../../modules/auth/registration/controllers/registration_controller.dart';
import '../../modules/base/controllers/base_controller.dart';
import '../../modules/cart/controllers/cart_controller.dart';
import '../../modules/checkout/controllers/checkout_controller.dart';
import '../../modules/detail_history/controllers/detail_history_controller.dart';
import '../../modules/detail_product/controllers/product_details_controller.dart';
import '../../modules/edit_profil/controller/edit_profil_controller.dart';
import '../../modules/history/controllers/history_controller.dart';
import '../../modules/home/controllers/home_controller.dart';
import '../../modules/notifikasi/controllers/notifikasi_controller.dart';
import '../../modules/policies_privacy/controllers/policies_privacy_controller.dart';
import '../../modules/profil/controllers/profil_controller.dart';
import '../../modules/setting/controllers/setting_controller.dart';
import '../../modules/splash/controllers/splash_controller.dart';

class AppBindings extends Bindings {
  @override
  Future<void> dependencies() async {
    final box = GetStorage();
    Get.lazyPut<DetailApiController>(() => DetailApiController());
    Get.lazyPut<ApiTestController>(() => ApiTestController());
    Get.lazyPut<Request>(() => Request());
    Get.lazyPut<FirebaseAuthServices>(() => FirebaseAuthServices());
    Get.lazyPut<SplashController>(() => SplashController());
    Get.lazyPut<LoginController>(() => LoginController());
    Get.lazyPut<RegistrationController>(() => RegistrationController());
    Get.lazyPut<BaseController>(() => BaseController());
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<CartController>(() => CartController());
    Get.put(HistoryController());
    // Get.lazyPut<HistoryController>(() => HistoryController());
    Get.lazyPut<DetailHistoryController>(() => DetailHistoryController());
    Get.lazyPut<ProfilController>(() => ProfilController());
    Get.lazyPut<ProductDetailsController>(() => ProductDetailsController());
    Get.lazyPut<CheckoutController>(() => CheckoutController());
    Get.lazyPut<GetStorage>(() => box);
    Get.lazyPut<AboutAppController>(() => AboutAppController());
    Get.lazyPut<PoliciesPrivacyController>(() => PoliciesPrivacyController());
    Get.lazyPut<SettingController>(() => SettingController());
    Get.lazyPut<EditProfilController>(() => EditProfilController());
    Get.lazyPut<NotifikasiController>(() => NotifikasiController());
  }
}
