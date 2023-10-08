import 'package:get/get.dart';

// controller
class HistoryController extends GetxController {
  RxInt selectedIndex = 0.obs;

  @override
  void onInit() {
    super.onInit();
    changeCategory(0);

  }

  void changeCategory(int index) {
    selectedIndex.value = index;
  }
}

// view 


