import 'package:get/get.dart';
import 'package:marvelindo_outlet/presentation/modules/chat/chat_controller.dart';
import '../../../../data/repositories/chat_repository_impl.dart';
import '../../../../data/services/firebase_auth_services.dart';
import '../../../../domain/repositories/chat_repository.dart';
import '../../cart/controllers/cart_controller.dart';
import '../../favorites/controllers/favorites_controller.dart';
import '../../home/controllers/home_controller.dart';
import '../../history/controllers/history_controller.dart';
import '../../settings/controllers/settings_controller.dart';
import '../controllers/base_controller.dart';

class BaseBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<FirebaseAuthService>(FirebaseAuthServiceImpl());
    Get.put<BaseController>(BaseController());
    Get.put<ChatController>(
        ChatController(chatRepository: ChatRepositoryImpl()));
    Get.put<HomeController>(HomeController());
    Get.put<FavoritesController>(FavoritesController());
    Get.put<CartController>(CartController());
    Get.put<HistoryController>(HistoryController());
    Get.put<SettingsController>(SettingsController(
        firebaseAuthService: Get.find<FirebaseAuthService>()));
    Get.put<FirebaseAuthService>(FirebaseAuthServiceImpl());
    Get.put<ChatRepository>(
      ChatRepositoryImpl(),
    );
  }
}
