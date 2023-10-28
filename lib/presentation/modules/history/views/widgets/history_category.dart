import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marvelindo_outlet/presentation/global/theme/light_theme_colors.dart';
import 'package:marvelindo_outlet/presentation/modules/history/controllers/history_controller.dart';

class Category {
  final String title;
  bool isSelected;
  Category(this.title, this.isSelected);
}

List<Category> categoryList = [
  Category("Proses", true),
  Category("Selesai", false),
  Category("Dibatalkan", false),
];

class HorizontalCategoriesView extends StatefulWidget {
  const HorizontalCategoriesView({super.key});

  @override
  State<HorizontalCategoriesView> createState() =>
      _HorizontalCategoriesViewState();
}

class _HorizontalCategoriesViewState extends State<HorizontalCategoriesView> {
  final homeController = HistoryController();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(3),
      height: 40,
      width: Get.width,
      child: GetBuilder<HistoryController>(
        init: homeController,
        initState: (_) {
          homeController.onInit();
        },
        builder: (_) {
          return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: categoryList.length,
            itemBuilder: (context, index) {
              return CategoryCard(
                category: categoryList[index],
                onPressed: () {
                  for (var category in categoryList) {
                    category.isSelected = false;
                  }
                  setState(() {
                    categoryList[index].isSelected = true;
                    homeController.changeCategory(1);
                  });
                },
              );
            },
          );
        },
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  final Category category;
  final VoidCallback onPressed;

  const CategoryCard(
      {required this.category, required this.onPressed, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          color: category.isSelected
              ? LightThemeColors.primaryColor
              : Colors.transparent),
      child: TextButton(
          style: const ButtonStyle(
              padding: MaterialStatePropertyAll(
                  EdgeInsets.symmetric(horizontal: 24))),
          onPressed: onPressed,
          child: Text(category.title,
              style: TextStyle(
                  color: category.isSelected
                      ? Colors.white
                      : LightThemeColors.primaryColor,
                  fontSize: 14))),
    );
  }
}
