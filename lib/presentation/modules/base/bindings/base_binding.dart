import 'package:get/get.dart';
import 'package:marvelindo_outlet/presentation/modules/chat/chat_controller.dart';
import '../../../../data/services/firebase_auth_services.dart';
import '../../../../domain/repositories/chat_repository.dart';
import '../../Auth/login/controller/login_controller.dart';
import '../../cart/controllers/cart_controller.dart';
import '../../favorites/controllers/favorites_controller.dart';
import '../../home/controllers/home_controller.dart';
import '../../history/controllers/history_controller.dart';
import '../../settings/controllers/settings_controller.dart';
import '../controllers/base_controller.dart';

class BaseBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BaseController>(() => BaseController());
    Get.lazyPut<ChatController>(
        () => ChatController(chatRepository: Get.find<ChatRepository>()));
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<FavoritesController>(() => FavoritesController());
    Get.lazyPut<CartController>(() => CartController());
    Get.lazyPut<HistoryController>(() => HistoryController());
    Get.lazyPut<SettingsController>(() => SettingsController(
        firebaseAuthService: Get.find<FirebaseAuthService>()));
    Get.lazyPut<FirebaseAuthService>(() => FirebaseAuthServiceImpl());
  }
}
