// ignore_for_file: override_on_non_overriding_member

import 'package:get/get.dart';
import 'package:marvelindo_outlet/data/services/network_request.dart';
import 'package:marvelindo_outlet/presentation/modules/auth/login/controller/login_controller.dart';
import 'package:marvelindo_outlet/presentation/modules/auth/registration/controllers/registration_controller.dart';
import 'package:marvelindo_outlet/presentation/modules/profil/controllers/profil_controller.dart';

import '../../../data/datasources/book _remote_datasources.dartbook_remote_data_source.dart';
import '../../../data/datasources/products_remote_datasources.dart';
import '../../../data/repositories/book_repository_impl.dart';
import '../../../data/repositories/chat_repository_impl.dart';
import '../../../data/repositories/product_repository_impl.dart';
import '../../../data/services/firebase_auth_services.dart';
import '../../../domain/repositories/chat_repository.dart';
import '../../../domain/usecase/book_usecase.dart';
import '../../../domain/usecase/product_usecase.dart';
import '../../modules/api_test/api_test_controller.dart';
import '../../modules/api_test/detail_api/detail_api_controller.dart';
import '../../modules/base/controllers/base_controller.dart';
import '../../modules/cart/controllers/cart_controller.dart';
import '../../modules/chat/chat_controller.dart';
import '../../modules/checkout/checkout_controller.dart';
import '../../modules/history/controllers/history_controller.dart';
import '../../modules/home/controllers/home_controller.dart';
import '../../modules/payment/payment_controller.dart';
import '../../modules/product_details/controllers/product_details_controller.dart';
import '../../modules/settings/controllers/settings_controller.dart';
import '../../modules/splash/controllers/splash_controller.dart';

class AppBindings extends Bindings {
  @override
  Future<void> dependencies() async {
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
    Get.lazyPut<HomeController>(() => HomeController(
        productUseCase: ProductUseCase(
            repository: ProductRepositoryImpl(
                remoteDataSource: ProductRemoteDataSourceImpl()))));
    Get.lazyPut<CartController>(() => CartController());
    Get.lazyPut<HistoryController>(() => HistoryController());
    Get.lazyPut<SettingsController>(() => SettingsController(
        firebaseAuthService: Get.find<FirebaseAuthService>()));
    Get.lazyPut<ChatRepository>(
      () => ChatRepositoryImpl(),
    );
    Get.lazyPut<ApiTestController>(
      () => ApiTestController(
          bookUseCase: BookUseCase(
              repository: BookRepositoryImpl(
                  remoteDataSource: BookRemoteDataSourceImpl())),
          productUseCase: ProductUseCase(
              repository: ProductRepositoryImpl(
                  remoteDataSource: ProductRemoteDataSourceImpl()))),
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
    Get.lazyPut<PaymentController>(
      () => PaymentController(),
    );
    Get.lazyPut<DetailApiController>(
      () => DetailApiController(),
    );
  }
}
