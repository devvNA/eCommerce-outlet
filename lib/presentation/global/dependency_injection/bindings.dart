// ignore_for_file: override_on_non_overriding_member

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../../core/networking/firebase_auth_services.dart';
import '../../../core/networking/network_request.dart';
import '../../../data/repositories/chat_repository_impl.dart';
import '../../../domain/repositories/chat_repository.dart';
import '../../modules/api_test/api_test_controller.dart';
import '../../modules/api_test/detail_api/detail_api_controller.dart';
import '../../modules/auth/login/controller/login_controller.dart';
import '../../modules/auth/registration/controllers/registration_controller.dart';
import '../../modules/base/controllers/base_controller.dart';
import '../../modules/cart/controllers/cart_controller.dart';
import '../../modules/chat/controllers/chat_controller.dart';
import '../../modules/checkout/controllers/checkout_controller.dart';
import '../../modules/detail_history/detail_history_controller.dart';
import '../../modules/history/controllers/history_controller.dart';
import '../../modules/home/controllers/home_controller.dart';
import '../../modules/product_details/controllers/product_details_controller.dart';
import '../../modules/profil/controllers/profil_controller.dart';
import '../../modules/settings/controllers/settings_controller.dart';
import '../../modules/splash/controllers/splash_controller.dart';

class AppBindings extends Bindings {
  @override
  Future<void> dependencies() async {
    final firebaseAuth = FirebaseAuth.instance;
    Get.lazyPut<FirebaseAuth>(() => firebaseAuth);
    Get.lazyPut<Request>(() => Request());
    Get.lazyPut(() => FirebaseAuthServiceImpl());
    Get.lazyPut<FirebaseAuthService>(() => FirebaseAuthServiceImpl());
    Get.lazyPut<SplashController>(
        () => SplashController(firebaseAuth: FirebaseAuthServiceImpl()));

    Get.lazyPut<LoginController>(
      () => LoginController(firebaseAuthService: FirebaseAuthServiceImpl()),
    );
    Get.lazyPut<RegistrationController>(() => RegistrationController());
    Get.lazyPut<BaseController>(() => BaseController());
    Get.lazyPut<ChatController>(
        () => ChatController(chatRepository: ChatRepositoryImpl()));
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<CartController>(() => CartController());
    Get.lazyPut<HistoryController>(() => HistoryController());
    Get.lazyPut<SettingsController>(() => SettingsController(
        firebaseAuthService: Get.find<FirebaseAuthService>()));
    Get.lazyPut<ChatRepository>(
      () => ChatRepositoryImpl(),
    );
    Get.lazyPut<ApiTestController>(
      () => ApiTestController(),
    );
    Get.lazyPut<ProfilController>(
      () => ProfilController(),
    );
    Get.lazyPut<ProductDetailsController>(
      () => ProductDetailsController(),
    );
    Get.lazyPut<CheckoutController>(
      () => CheckoutController(),
    );
    Get.lazyPut<DetailApiController>(
      () => DetailApiController(),
    );
    final box = GetStorage();
    Get.lazyPut<GetStorage>(() => box);
    Get.lazyPut<DetailHistoryController>(
      () => DetailHistoryController(),
    );
  }
}
