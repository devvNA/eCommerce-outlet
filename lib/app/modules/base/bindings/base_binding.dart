import 'package:get/get.dart';
import 'package:marvelindo_outlet/app/modules/auth/login/controller/login_controller.dart';
import '../../cart/controllers/cart_controller.dart';
import '../../favorites/controllers/favorites_controller.dart';
import '../../home/controllers/home_controller.dart';
import '../../notifications/controllers/history_controller.dart';
import '../../settings/controllers/settings_controller.dart';
import '../controllers/base_controller.dart';

class BaseBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BaseController>(() => BaseController());
    Get.lazyPut<LoginController>(() => LoginController());
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<FavoritesController>(() => FavoritesController());
    Get.lazyPut<CartController>(() => CartController());
    Get.lazyPut<HistoryController>(() => HistoryController());
    Get.lazyPut<SettingsController>(() => SettingsController());
  }
}
