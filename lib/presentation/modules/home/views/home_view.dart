import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:marvelindo_outlet/presentation/global/widgets/shimmer_widget.dart';
import '../../../global/widgets/error_state_widget.dart';
import '../../../global/theme/my_colors.dart';
import '../controllers/home_controller.dart';
import 'widgets/product_item.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return SafeArea(
        child: Scaffold(
            body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              width: Get.width,
              decoration: const BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(35),
                  bottomRight: Radius.circular(35),
                ),
              ),
              child: Column(
                children: [
                  ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(
                        controller.getDisplayProfile(),
                      ),
                    ),
                    title: Text(
                      controller.getUsername(),
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    subtitle: Text(
                      controller.getEmail(),
                      style: const TextStyle(
                        color: Colors.white70,
                      ),
                    ),
                    trailing: Container(
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(74, 255, 255, 255),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.notifications_active_sharp,
                          size: 26.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  10.verticalSpace,
                  _searchBar(),
                ],
              ),
            ),
            15.verticalSpace,
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 18),
              child: Text(
                "Produk",
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                ),
              ),
            ),
            _categories(),
            5.verticalSpace,
            Expanded(
              child: Obx(() {
                if (controller.loading()) {
                  return GridView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 3,
                        mainAxisSpacing: 3,
                        mainAxisExtent: 250,
                      ),
                      itemCount: 4,
                      itemBuilder: (context, index) =>
                          const ShimmerLayout(child: ShimmerCard()));
                }
                if (controller.listProduk.isEmpty) {
                  return const Center(
                      child:
                          ErrorStateWidget(message: "Produk tidak ditemukan"));
                }
                if (controller.searchController.value.text.isEmpty) {
                  return RefreshIndicator(
                    color: AppColors.primaryColor,
                    onRefresh: () async {
                      controller.onRefreshProducts();
                    },
                    child: Obx(() {
                      return GridView.builder(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        primary: true,
                        physics: const BouncingScrollPhysics(
                            parent: AlwaysScrollableScrollPhysics()),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 3,
                          mainAxisSpacing: 3,
                          mainAxisExtent: 250,
                        ),
                        itemCount: controller.listProduk.length,
                        itemBuilder: (context, index) => ProductItem(
                          produk: controller.listProduk[index],
                        ),
                      );
                    }),
                  );
                }
                if (controller.searchList().isEmpty) {
                  return const Center(
                      child:
                          ErrorStateWidget(message: "Produk tidak ditemukan"));
                } else {
                  return RefreshIndicator(
                    color: AppColors.primaryColor,
                    onRefresh: () async {
                      controller.onRefreshProducts();
                    },
                    child: Obx(() {
                      return GridView.builder(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        primary: true,
                        physics: const BouncingScrollPhysics(
                            parent: AlwaysScrollableScrollPhysics()),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 3,
                          mainAxisSpacing: 3,
                          mainAxisExtent: 250,
                        ),
                        itemCount: controller.searchList.length,
                        itemBuilder: (context, index) => ProductItem(
                          produk: controller.searchList[index],
                        ),
                      );
                    }),
                  );
                }
              }),
            )
          ],
        )),
      );
    });
  }

  Widget _searchBar() {
    return Container(
      margin: const EdgeInsets.only(right: 16, left: 16, bottom: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Row(
        children: [
          const Icon(
            Icons.search,
            color: AppColors.primaryColor,
          ),
          7.horizontalSpace,
          Expanded(
            child: TextField(
              controller: controller.searchController.value,
              onChanged: (value) {
                controller.onSearchProduct(value);
              },
              style: Get.textTheme.bodyMedium,
              cursorColor: AppColors.primaryColor,
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: 'cari produk',
              ),
            ),
          ),
          5.horizontalSpace,
        ],
      ),
    );
  }

  Widget _categories() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: SizedBox(
        height: 50,
        child: ListView.builder(
          itemCount: controller.categories.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Obx(() {
              return Row(
                children: [
                  ElevatedButton(
                    clipBehavior: Clip.antiAlias,
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 8),
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
                  10.horizontalSpace
                ],
              );
            });
          },
        ),
      ),
    );
  }
}
