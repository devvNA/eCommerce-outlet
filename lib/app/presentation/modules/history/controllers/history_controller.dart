import 'package:get/get.dart';

// controller
class HistoryController extends GetxController {
  RxInt selectedIndex = RxInt(0);

  @override
  void onInit() {
    super.onInit();
    changeStatus(0);
  }


  void changeStatus(int index) {
    selectedIndex.value = index;
  }
}
