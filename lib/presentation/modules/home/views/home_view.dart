// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import '../../../global/common/product_item.dart';
import '../../../global/common/screen_title.dart';
import '../../../global/theme/light_theme_colors.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<HomeController>(builder: (context) {
        return ListView(
          clipBehavior: Clip.antiAlias,
          physics: const AlwaysScrollableScrollPhysics(),
          padding: const EdgeInsets.all(16),
          children: [
            const ScreenTitle(
              title: 'Produk',
            ),
            10.verticalSpace,
            const SearchProduct(),
            20.verticalSpace,
            const CategoryProduct(),
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
      child: Row(
        children: [
          const Icon(
            Icons.search,
          ),
          const SizedBox(width: 8.0),
          const Expanded(
            child: TextField(
              cursorColor: LightThemeColors.primaryColor,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Cari produk',
              ),
            ),
          ),
          const SizedBox(width: 8.0),
          ClipRRect(
            borderRadius: BorderRadius.circular(30.0),
            child: Material(
              color: LightThemeColors.primaryColor,
              child: InkWell(
                onTap: () {},
                child: Container(
                  padding: const EdgeInsets.all(6.0),
                  child: const Icon(
                    Icons.tune,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CategoryProduct extends StatefulWidget {
  const CategoryProduct({
    super.key,
  });

  @override
  State<CategoryProduct> createState() => _CategoryProductState();
}

class _CategoryProductState extends State<CategoryProduct> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 35.0,
      child: ListView.builder(
        itemCount: 5,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedIndex = index;
              });
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              margin: const EdgeInsets.only(right: 10.0),
              decoration: BoxDecoration(
                color: index == selectedIndex
                    ? LightThemeColors.primaryColor
                    : Colors.grey[400],
                borderRadius: const BorderRadius.all(
                  Radius.circular(16.0),
                ),
              ),
              child: Center(
                child: Text(
                  "Menu ${index + 1}",
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 13.0,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
