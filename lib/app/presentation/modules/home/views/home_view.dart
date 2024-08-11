import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:marvelindo_outlet/app/presentation/global/widgets/shimmer_widget.dart';
import 'package:marvelindo_outlet/app/routes/app_pages.dart';
import 'package:shimmer/shimmer.dart';

import '../../../global/theme/my_colors.dart';
import '../../../global/widgets/error_state_widget.dart';
import '../controllers/home_controller.dart';
import 'widgets/product_item.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    return Scaffold(
        body: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _profileHeader(context),
        16.verticalSpace,
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 18),
          child: Text(
            "Produk",
            textAlign: TextAlign.left,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18.0,
            ),
          ),
        ),
        4.verticalSpace,
        _categories(),
        4.verticalSpace,
        Expanded(
          child: Obx(() {
            if (controller.loading()) {
              return GridView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
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
                  child: ErrorStateWidget(message: "Produk tidak ditemukan"));
            }
            if (controller.searchController.value.text.isEmpty) {
              return RefreshIndicator(
                color: AppColors.primaryColor,
                onRefresh: () async {
                  controller.onRefreshProducts();
                },
                child: GridView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  primary: true,
                  physics: const BouncingScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 3,
                    mainAxisSpacing: 3,
                    mainAxisExtent: 250,
                  ),
                  itemCount: controller.listProduk.length,
                  itemBuilder: (context, index) => ProductItem(
                    produk: controller.listProduk[index],
                  ),
                ),
              );
            }
            if (controller.searchList().isEmpty) {
              return const Center(
                  child: ErrorStateWidget(message: "Produk tidak ditemukan"));
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
    ));
  }

  Container _profileHeader(BuildContext context) {
    var theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.all(16),
      width: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            "assets/images/bg_header.jpg",
          ),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(32),
          bottomRight: Radius.circular(32),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          16.verticalSpace,
          Row(
            children: [
              GestureDetector(
                onTap: () => Get.toNamed(Routes.PROFIL),
                child: const Hero(
                  tag: "profile",
                  child: CircleAvatar(
                    radius: 20,
                    backgroundImage: AssetImage("assets/images/no-image.jpg"),
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Hai, ${controller.outlet!.namaOutlet.split(' ')[0].capitalize}",
                      style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                    const SizedBox(height: 4),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        "Status Kamu: ${controller.outlet!.jenisOutlet!.nama}",
                        style: theme.textTheme.bodySmall
                            ?.copyWith(color: Colors.white, fontSize: 12),
                      ),
                    ),
                  ],
                ),
              ),
              _badgeNotification(),
            ],
          ),
          const SizedBox(height: 20),
          _searchBox(),
        ],
      ),
    );
  }

  InkWell _badgeNotification() {
    return InkWell(
      onTap: () {
        // Get.toNamed(Routes.NOTIFIKASI);
        // log(FirebaseAuth.instance.currentUser!.uid);
        log("Token: ${controller.box.read("TOKEN")}");
        log("Remember Me: ${controller.box.read("REMEMBER_ME_EMAIL")}");
        log("Remember Me: ${controller.box.read("REMEMBER_ME_PASSWORD")}");

        // log("listCategories : ${controller.listCategories}");
      },
      child: Container(
        padding: const EdgeInsets.all(5.0),
        decoration: BoxDecoration(
          color: const Color.fromARGB(74, 255, 255, 255),
          borderRadius: BorderRadius.circular(8),
        ),
        child: const Badge(
          backgroundColor: AppColors.blue,
          label: Text(
            "5",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          child: Icon(
            Icons.notifications,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Widget _searchBox() {
    return Container(
      margin: const EdgeInsets.only(right: 16, left: 16, bottom: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.0),
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
              controller: controller.searchController,
              onChanged: (value) => controller.onSearchProduct(),
              style: Get.textTheme.bodyMedium,
              cursorColor: AppColors.primaryColor,
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: 'cari produk',
                hintStyle: TextStyle(
                  fontSize: 13,
                ),
              ),
            ),
          ),
          5.horizontalSpace,
          InkWell(
            onTap: () {
              controller.searchController.clear();
              controller.onRefreshProducts();
            },
            child: const Icon(
              Icons.close,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }

  Widget _categories() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: SizedBox(
        height: 50,
        child: Obx(() {
          if (controller.loading()) {
            return ListView.builder(
              itemCount: 5, // Jumlah placeholder shimmer
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Shimmer.fromColors(
                    baseColor: Colors.grey[300]!,
                    highlightColor: Colors.grey[100]!,
                    child: Container(
                      width: 70,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(32),
                      ),
                    ),
                  ),
                );
              },
            );
          }
          return ListView.builder(
            itemCount: controller.listCategories.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
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
                      controller.listCategories[index],
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
            },
          );
        }),
      ),
    );
  }
}
