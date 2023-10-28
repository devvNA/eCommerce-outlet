// ignore_for_file: constant_identifier_names

import 'package:get/get.dart';
import 'package:marvelindo_outlet/presentation/modules/api_test/detail_api/detail_api_view.dart';
import 'package:marvelindo_outlet/presentation/modules/payment/payment_view.dart';

import '../global/dependency_injection/bindings.dart';
import '../modules/api_test/api_test_page.dart';
import '../modules/auth/login/views/login_view.dart';
import '../modules/auth/registration/views/registration_view.dart';
import '../modules/base/views/base_view.dart';
import '../modules/cart/views/cart_view.dart';
import '../modules/chat/chat_view.dart';
import '../modules/checkout/checkout_view.dart';
import '../modules/favorites/views/favorites_view.dart';
import '../modules/history/views/history_view.dart';
import '../modules/home/views/home_view.dart';
import '../modules/product_details/views/product_details_view.dart';
import '../modules/profil/views/profil_view.dart';
import '../modules/settings/views/settings_view.dart';
import '../modules/splash/views/splash_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
        name: _Paths.SPLASH,
        page: () => const SplashView(),
        // binding: SplashBinding(),
        binding: AppBindings()),
    GetPage(
        name: _Paths.LOGIN,
        page: () => const LoginView(),
        // binding: LoginBinding(),
        transition: Transition.native,
        transitionDuration: const Duration(seconds: 1),
        binding: AppBindings()),
    GetPage(
        name: _Paths.REGISTRATION,
        page: () => RegistrationView(),
        binding: AppBindings()
        // binding: RegistrationBinding(),
        ),
    GetPage(
        name: _Paths.BASE,
        page: () => const BaseView(),
        // binding: BaseBinding(),
        transition: Transition.cupertino,
        transitionDuration: const Duration(seconds: 1),
        binding: AppBindings()),
    GetPage(
        name: _Paths.HOME,
        page: () => const HomeView(),
        // binding: HomeBinding(),
        transition: Transition.cupertino,
        transitionDuration: const Duration(seconds: 1),
        binding: AppBindings()),
    GetPage(
        name: _Paths.FAVORITES,
        page: () => const FavoritesView(),
        binding: AppBindings()
        // binding: FavoritesBinding(),
        ),
    GetPage(
        name: _Paths.CART, page: () => const CartView(), binding: AppBindings()

        // binding: CartBinding(),
        ),
    GetPage(
        name: _Paths.CHECKOUT,
        page: () => const CheckoutView(),
        binding: AppBindings()
        // binding: HistoryBinding(),
        ),
    GetPage(
        name: _Paths.HISTORY,
        page: () => const HistoryView(),
        binding: AppBindings()
        // binding: HistoryBinding(),
        ),
    GetPage(
        name: _Paths.SETTINGS,
        page: () => const SettingsView(),
        binding: AppBindings()
        // binding: SettingsBinding(),
        ),
    GetPage(
      name: _Paths.PRODUCT_DETAILS,
      page: () => const ProductDetailsView(),
      binding: AppBindings(),
      // binding: ProductDetailsBinding(),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 250),
    ),
    GetPage(
        name: _Paths.PROFIL,
        page: () => const ProfilView(),
        binding: AppBindings()
        // binding: ProfilBinding(),
        ),
    GetPage(
        name: _Paths.CHAT, page: () => const ChatView(), binding: AppBindings()
        // binding: ChatBinding(),
        ),
    GetPage(
        name: _Paths.API_TEST,
        page: () => const ApiTestPage(),
        binding: AppBindings()
        // binding: ApiTestBinding(),
        ),
    GetPage(
        name: _Paths.PAYMENT,
        page: () => const PaymentView(),
        binding: AppBindings()
        // binding: ApiTestBinding(),
        ),
    GetPage(
        name: _Paths.DETAIL_API,
        page: () => const DetailApiView(),
        binding: AppBindings()
        // binding: ApiTestBinding(),
        ),
  ];
}
