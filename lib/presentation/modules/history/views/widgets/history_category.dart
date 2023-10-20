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
  const HorizontalCategoriesView({Key? key}) : super(key: key);

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
                onPressed: (b) {
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

class CategoryCard extends StatefulWidget {
  final Category category;
  final Function(bool) onPressed;

  const CategoryCard(
      {required this.category, required this.onPressed, Key? key})
      : super(key: key);

  @override
  State<CategoryCard> createState() => _CategoryCardState();
}

class _CategoryCardState extends State<CategoryCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          color: widget.category.isSelected
              ? LightThemeColors.primaryColor
              : Colors.transparent),
      child: TextButton(
          style: const ButtonStyle(
              padding: MaterialStatePropertyAll(
                  EdgeInsets.symmetric(horizontal: 24))),
          onPressed: () {
            widget.onPressed(true);
          },
          child: Text(widget.category.title,
              style: TextStyle(
                  color: widget.category.isSelected
                      ? Colors.white
                      : LightThemeColors.primaryColor,
                  fontSize: 14))),
    );
  }
}
