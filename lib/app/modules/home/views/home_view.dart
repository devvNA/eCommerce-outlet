import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import '../../../common/product_item.dart';
import '../../../common/screen_title.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        clipBehavior: Clip.antiAlias,
        physics: const AlwaysScrollableScrollPhysics(),
        padding: const EdgeInsets.all(16),
        children: [
          const ScreenTitle(
            title: 'Produk',
          ),
          20.verticalSpace,
          GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, crossAxisSpacing: 15, mainAxisExtent: 220),
            shrinkWrap: true,
            primary: false,
            itemCount: controller.products.length,
            itemBuilder: (context, index) => ProductItem(
              product: controller.products[index],
            ),
          ),
        ],
      ),
    );
  }
}
