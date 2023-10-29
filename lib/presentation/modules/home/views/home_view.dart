// ignore_for_file: library_private_types_in_public_api, must_be_immutable, unused_element

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'widgets/product_item.dart';
import '../../../global/common/screen_title.dart';
import '../../../global/theme/light_theme_colors.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: GetBuilder<HomeController>(builder: (context) {
        return Padding(
          padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
          child: Column(
            children: [
              10.verticalSpace,
              const ScreenTitle(
                title: 'Produk',
              ),
              10.verticalSpace,
              const SearchProduct(),
              10.verticalSpace,
              SizedBox(
                height: 50,
                child: ListView.builder(
                  itemCount: controller.categories.value.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            controller.onChangeTab(index);
                          },
                          child: Chip(
                            clipBehavior: Clip.hardEdge,
                            backgroundColor: controller.selectedIndex == index
                                ? LightThemeColors.primaryColor
                                : Colors.grey[350],
                            elevation: 1,
                            label: Text(
                              controller.categories.value[index],
                              style: const TextStyle(fontSize: 12),
                            ),
                            padding: const EdgeInsets.all(9.0),
                          ),
                        ),
                        const SizedBox(
                          width: 6.0,
                        ),
                      ],
                    );
                  },
                ),
              ),
              10.verticalSpace,
              controller.listProducts.value.isNotEmpty
                  ? Expanded(
                      child: Visibility(
                        visible: controller.selectedIndex == 0,
                        child: RefreshIndicator(
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
                                mainAxisExtent: 210,
                              ),
                              shrinkWrap: true,
                              itemCount: controller.listProducts.value.length,
                              itemBuilder: (context, index) => ProductItem(
                                product: controller.listProducts.value[index],
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  : Expanded(
                      child: SizedBox(
                        height: Get.height / 1.5,
                        child: const Center(
                          child: CircularProgressIndicator(),
                        ),
                      ),
                    ),
              // Expanded(
              //   child: Visibility(
              //     visible: controller.selectedIndex == 1,
              //     child: SizedBox(
              //       height: Get.height / 1.5,
              //       child: const Center(
              //         child: Text(
              //           "Kategori Perdana",
              //           style: TextStyle(
              //             fontSize: 20.0,
              //             fontWeight: FontWeight.bold,
              //           ),
              //         ),
              //       ),
              //     ),
              //   ),
              // ),
              // Expanded(
              //   child: Visibility(
              //     visible: controller.selectedIndex == 2,
              //     child: SizedBox(
              //       height: Get.height / 1.5,
              //       child: const Center(
              //         child: Text(
              //           "Kategori Voucher",
              //           style: TextStyle(
              //             fontSize: 20.0,
              //             fontWeight: FontWeight.bold,
              //           ),
              //         ),
              //       ),
              //     ),
              //   ),
              // ),
              // SizedBox(
              //   width: Get.width,
              //   height: Get.height / 1.5,
              //   child: PageView.builder(
              //     itemCount: controller.categories.value.length,
              //     controller: pageController,
              //     physics: const NeverScrollableScrollPhysics(),
              //     itemBuilder: (context, index) {
              //       return Column(
              //         mainAxisAlignment: MainAxisAlignment.center,
              //         children: [
              //           Text(
              //             "${controller.categories.value[controller.selectedIndex!]} Tab Content",
              //             style: const TextStyle(
              //                 fontWeight: FontWeight.w500,
              //                 fontSize: 25,
              //                 color: LightThemeColors.primaryColor),
              //           ),
              //         ],
              //       );
              //     },
              //   ),
              // ),
            ],
          ),
        );
      }),
    );
  }
}

class SearchProduct extends StatelessWidget {
  const SearchProduct({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
      child: const Row(
        children: [
          Icon(
            Icons.search,
          ),
          SizedBox(width: 8.0),
          Expanded(
            child: TextField(
              cursorColor: LightThemeColors.primaryColor,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Cari produk',
              ),
            ),
          ),
          SizedBox(width: 8.0),
        ],
      ),
    );
  }
}
