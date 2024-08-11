// ignore_for_file: constant_identifier_names

import 'package:get/get.dart';
import 'package:marvelindo_outlet/app/presentation/global/dependency_injection/bindings.dart';
import 'package:marvelindo_outlet/app/presentation/modules/api_test/api_test_page.dart';
import 'package:marvelindo_outlet/app/presentation/modules/api_test/detail_api/detail_api_view.dart';
import 'package:marvelindo_outlet/app/presentation/modules/auth/login/views/login_view.dart';
import 'package:marvelindo_outlet/app/presentation/modules/auth/registration/views/registration_view.dart';
import 'package:marvelindo_outlet/app/presentation/modules/base/views/base_view.dart';
import 'package:marvelindo_outlet/app/presentation/modules/cart/views/cart_view.dart';
import 'package:marvelindo_outlet/app/presentation/modules/checkout/views/checkout_view.dart';
import 'package:marvelindo_outlet/app/presentation/modules/detail_history/detail_transfer/views/detail_transfer_page.dart';
import 'package:marvelindo_outlet/app/presentation/modules/detail_history/views/detail_history_view.dart';
import 'package:marvelindo_outlet/app/presentation/modules/detail_product/views/product_details_view.dart';
import 'package:marvelindo_outlet/app/presentation/modules/history/views/history_view.dart';
import 'package:marvelindo_outlet/app/presentation/modules/home/views/home_view.dart';
import 'package:marvelindo_outlet/app/presentation/modules/profil/views/profil_view.dart';
import 'package:marvelindo_outlet/app/presentation/modules/splash/views/splash_view.dart';

import '../presentation/modules/about/views/about_app_page.dart';
import '../presentation/modules/edit_profil/views/edit_profil_page.dart';
import '../presentation/modules/notifikasi/views/notifikasi_view.dart';
import '../presentation/modules/policies_privacy/views/policies_privacy_page.dart';
import '../presentation/modules/setting/views/setting_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static final routes = [
    GetPage(
        name: _Paths.SPLASH,
        page: () => const SplashView(),
        binding: AppBindings()),
    GetPage(
        name: _Paths.LOGIN,
        page: () => const LoginView(),
        transition: Transition.native,
        transitionDuration: const Duration(milliseconds: 700),
        binding: AppBindings()),
    GetPage(
        name: _Paths.REGISTRATION,
        page: () => const RegistrationView(),
        binding: AppBindings()),
    GetPage(
        name: _Paths.BASE,
        page: () => const BaseView(),
        transition: Transition.cupertino,
        transitionDuration: const Duration(milliseconds: 700),
        binding: AppBindings()),
    GetPage(
        name: _Paths.HOME,
        page: () => const HomeView(),
        transition: Transition.cupertino,
        transitionDuration: const Duration(milliseconds: 700),
        binding: AppBindings()),
    GetPage(
        name: _Paths.CART,
        page: () => const CartView(),
        binding: AppBindings()),
    GetPage(
        name: _Paths.CHECKOUT,
        page: () => const CheckoutView(),
        binding: AppBindings()),
    GetPage(
        name: _Paths.HISTORY,
        page: () => const HistoryView(),
        binding: AppBindings()),
    GetPage(
      name: _Paths.PRODUCT_DETAILS,
      page: () => const ProductDetailsView(),
      binding: AppBindings(),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 300),
    ),
    GetPage(
        name: _Paths.PROFIL,
        page: () => const ProfilView(),
        binding: AppBindings()),
    GetPage(
        name: _Paths.API_TEST,
        page: () => ApiTestPage(),
        binding: AppBindings()),
    GetPage(
        name: _Paths.DETAIL_API,
        page: () => const DetailApiView(),
        binding: AppBindings()),
    GetPage(
        name: _Paths.DETAIL_HISTORY,
        page: () => const DetailHistoryView(),
        binding: AppBindings()),
    GetPage(
      name: _Paths.ABOUT_US,
      page: () => const AboutAppView(),
      binding: AppBindings(),
    ),
    GetPage(
      name: _Paths.POLICIES_PRIVACY,
      page: () => const PoliciesPrivacyView(),
      binding: AppBindings(),
    ),
    GetPage(
      name: _Paths.SETTING,
      page: () => const SettingView(),
      binding: AppBindings(),
    ),
    GetPage(
      name: _Paths.EDIT_PROFIL,
      page: () => const EditProfilView(),
      binding: AppBindings(),
    ),
    GetPage(
      name: _Paths.NOTIFIKASI,
      page: () => const NotifikasiView(),
      binding: AppBindings(),
    ),
    GetPage(
      name: _Paths.NOTIFIKASI,
      page: () => const NotifikasiView(),
      binding: AppBindings(),
    ),
    GetPage(
      name: _Paths.DETAIL_TRANSFER,
      page: () => const DetailTransferView(),
      binding: AppBindings(),
    ),
  ];
}
