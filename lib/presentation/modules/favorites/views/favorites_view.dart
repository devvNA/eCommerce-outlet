import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../../../global/common/no_data.dart';
import '../../home/views/widgets/product_item.dart';
import '../../../global/common/screen_title.dart';
import '../../../routes/app_pages.dart';
import '../controllers/favorites_controller.dart';

class FavoritesView extends GetView<FavoritesController> {
  const FavoritesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: ListView(
          children: [
            30.verticalSpace,
            const ScreenTitle(
              title: 'Favorites',
              dividerEndIndent: 200,
            ),
            20.verticalSpace,
            GetBuilder<FavoritesController>(
              builder: (_) => controller.products.isEmpty
                  ? NoData(
                      text: 'Belum Ada Produk di Favorit!',
                      onPressed: () {
                        Get.offAllNamed(Routes.BASE);
                      },
                    )
                  : GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 15.w,
                        mainAxisSpacing: 15.h,
                        mainAxisExtent: 260.h,
                      ),
                      shrinkWrap: true,
                      primary: false,
                      itemCount: controller.products.length,
                      itemBuilder: (context, index) => ProductItem(
                        product: controller.products[index],
                      ),
                    ),
            ),
            10.verticalSpace,
          ],
        ),
      ),
    );
  }
}
