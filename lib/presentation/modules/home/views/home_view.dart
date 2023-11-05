// ignore_for_file: library_private_types_in_public_api, must_be_immutable, unused_element

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import '../../../global/common/error_state_widget.dart';
import 'widgets/product_item.dart';
import '../../../global/common/screen_title.dart';
import '../../../global/theme/light_theme_colors.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
          extendBody: true,
          body: Padding(
            padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
            child: Column(
              children: [
                10.verticalSpace,
                const ScreenTitle(
                  title: 'Produk',
                ),
                10.verticalSpace,
                _searchBar(),
                10.verticalSpace,
                _buildCategory(),
                10.verticalSpace,
                Expanded(
                  child: Obx(() {
                    if (controller.loading.value) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    if (controller.listProducts.isEmpty) {
                      return const Center(
                          child: ErrorStateWidget(
                              message: "Produk tidak ditemukan"));
                    }
                    return RefreshIndicator(
                      color: LightThemeColors.primaryColor,
                      onRefresh: () async {
                        controller.onRefreshProducts();
                      },
                      child: SizedBox(
                        height: Get.height,
                        child: GridView.builder(
                          primary: true,
                          physics: const BouncingScrollPhysics(
                              parent: AlwaysScrollableScrollPhysics()),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 15,
                                  mainAxisExtent: 200),
                          itemCount: controller.listProducts.length,
                          itemBuilder: (context, index) => ProductItem(
                            product: controller.listProducts[index],
                          ),
                        ),
                      ),
                    );
                  }),
                )
              ],
            ),
          ));
    });
  }

  Container _searchBar() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(30.0),
        boxShadow: const [
          BoxShadow(
            color: Color.fromARGB(255, 207, 202, 202),
            blurRadius: 2,
          ),
        ],
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Row(
        children: [
          const Icon(
            Icons.search,
          ),
          const SizedBox(width: 8.0),
          Expanded(
            child: TextField(
              onChanged: (value) {},
              style: Get.textTheme.bodyMedium,
              cursorColor: LightThemeColors.primaryColor,
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: 'cari produk',
              ),
            ),
          ),
          const SizedBox(width: 8.0),
        ],
      ),
    );
  }

  SizedBox _buildCategory() {
    return SizedBox(
      height: 50,
      child: ListView.builder(
        itemCount: controller.categories.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Obx(() {
            return Row(
              children: [
                ElevatedButton(
                  autofocus: true,
                  clipBehavior: Clip.hardEdge,
                  style: ElevatedButton.styleFrom(
                    elevation: 0.0,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    backgroundColor: controller.selectedIndex.value == index
                        ? LightThemeColors.primaryColor
                        : Get.theme.scaffoldBackgroundColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32),
                    ),
                    side: const BorderSide(
                        color: LightThemeColors.primaryColor, width: 1),
                  ),
                  onPressed: () {
                    controller.onChangeCategory(index);
                  },
                  child: Text(
                    controller.categories[index],
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: controller.selectedIndex.value == index
                          ? Colors.white
                          : LightThemeColors.primaryColor,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 8.0,
                ),
              ],
            );
          });
        },
      ),
    );
  }
}
