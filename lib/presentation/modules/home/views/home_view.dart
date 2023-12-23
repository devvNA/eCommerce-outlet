// ignore_for_file: library_private_types_in_public_api, must_be_immutable, unused_element

import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../global/widgets/loading_custom_widget.dart';
import '../../../global/widgets/error_state_widget.dart';
import '../../../global/widgets/screen_title.dart';
import '../../../global/theme/light_theme_colors.dart';
import '../controllers/home_controller.dart';
import 'widgets/product_item.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (_) {
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
                5.verticalSpace,
                Expanded(
                  child: Obx(() {
                    if (controller.loading.value) {
                      return const Center(child: LoadingCustomWidget());
                    }
                    if (controller.listProducts.isEmpty) {
                      return const Center(
                          child: ErrorStateWidget(
                              message: "Produk tidak ditemukan"));
                    }
                    if (controller.searchController.value.text.isEmpty) {
                      return RefreshIndicator(
                        color: AppColors.primaryColor,
                        onRefresh: () async {
                          controller.onRefreshProducts();
                        },
                        child: Obx(() {
                          return SizedBox(
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
                          );
                        }),
                      );
                    }
                    if (controller.searchList.isEmpty) {
                      return const Center(
                          child: ErrorStateWidget(
                              message: "Produk tidak ditemukan"));
                    } else {
                      return RefreshIndicator(
                        color: AppColors.primaryColor,
                        onRefresh: () async {
                          controller.onRefreshProducts();
                        },
                        child: Obx(() {
                          return SizedBox(
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
                              itemCount: controller.searchList.length,
                              itemBuilder: (context, index) => ProductItem(
                                product: controller.searchList[index],
                              ),
                            ),
                          );
                        }),
                      );
                    }
                  }),
                )
              ],
            ),
          ));
    });
  }

  Widget _searchBar() {
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
              controller: controller.searchController.value,
              onChanged: (value) {
                controller.onSearchProduct(value);
                log(value);
              },
              style: Get.textTheme.bodyMedium,
              cursorColor: AppColors.primaryColor,
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
                        ? AppColors.primaryColor
                        : Get.theme.scaffoldBackgroundColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32),
                    ),
                    side: const BorderSide(
                        color: AppColors.primaryColor, width: 1),
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
                          : AppColors.primaryColor,
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
