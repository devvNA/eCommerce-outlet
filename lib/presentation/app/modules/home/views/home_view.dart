import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import '../../../../global/common/product_item.dart';
import '../../../../global/common/screen_title.dart';
import '../../../../global/theme/light_theme_colors.dart';
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
          10.verticalSpace,
          SizedBox(
            height: 35.0,
            child: ListView.builder(
              itemCount: 5,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                var item = {};
                bool selected = index == 0;

                return Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  margin: const EdgeInsets.only(right: 10.0),
                  decoration: BoxDecoration(
                    color:
                        selected ? LightThemeColors.primaryColor : Colors.grey,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(16.0),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      "Menu ${index + 1}",
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 11.0,
                      ),
                    ),
                  ),
                );
              },
            ),
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
