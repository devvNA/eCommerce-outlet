// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:marvelindo_outlet/presentation/global/theme/light_theme_colors.dart';

import '../../../../../data/models/product_model.dart';
import '../../../../global/utils/constants.dart';
import '../../controllers/cart_controller.dart';

class CartItem extends GetView<CartController> {
  final ProductModel product;
  const CartItem({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController quantityController =
        TextEditingController(text: product.quantity.toString());

    final theme = context.theme;

    return Padding(
      padding: EdgeInsets.only(bottom: 20.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20.r),
            child: Stack(
              children: [
                Container(
                  width: 100,
                  height: 125,
                  color: const Color(0xFFEDF1FA),
                ),
                Positioned(
                  left: 15.w,
                  bottom: -150.h,
                  child: Image.asset(
                    product.image!,
                    height: 250.h,
                  ),
                ),
              ],
            ),
          ),
          10.horizontalSpace,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              5.verticalSpace,
              Text(
                product.name!,
                style: theme.textTheme.displayMedium?.copyWith(fontSize: 16),
                overflow: TextOverflow.ellipsis,
              ),
              5.verticalSpace,
              Text('Jenis: ${product.size}',
                  style: theme.textTheme.bodyMedium?.copyWith(fontSize: 12.sp)),
              5.verticalSpace,
              Text(
                'Rp${product.price}',
                style: theme.textTheme.displayLarge
                    ?.copyWith(fontSize: 14.sp, fontWeight: FontWeight.w300),
              ),
              10.verticalSpace,
              GetBuilder<CartController>(
                id: 'ProductQuantity',
                builder: (_) => Row(
                  children: [
                    GestureDetector(
                      onTap: () => controller.onDecreasePressed(product.id!),
                      child: SvgPicture.asset(Constants.decreaseIcon),
                    ),
                    10.horizontalSpace,
                    SizedBox(
                      height: 53,
                      width: 60,
                      child: TextFormField(
                        style: const TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w500),
                        maxLines: 1,
                        scrollPhysics: const AlwaysScrollableScrollPhysics(),
                        controller: quantityController,
                        keyboardType: TextInputType.number,
                        cursorColor: LightThemeColors.primaryColor,
                        textDirection: TextDirection.ltr,
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide:
                                  const BorderSide(color: Colors.black12)),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: const BorderSide(
                              color: LightThemeColors.primaryColor,
                            ),
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: const BorderSide(
                                color: LightThemeColors.primaryColor,
                              )),
                          prefixIconColor: LightThemeColors.primaryColor,
                          suffixIconColor: LightThemeColors.primaryColor,
                          filled: true,
                          fillColor: Colors.grey[150],
                        ),
                        onChanged: (value) async {
                          await Future.delayed(
                              const Duration(milliseconds: 500));
                          controller.onInputQuantity(
                              product.id!, int.parse(value));
                        },
                      ),
                    ),
                    10.horizontalSpace,
                    GestureDetector(
                      onTap: () => controller.onIncreasePressed(product.id!),
                      child: SvgPicture.asset(Constants.increaseIcon),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const Spacer(),
          InkWell(
            onTap: () => controller.onDeletePressed(product.id!),
            customBorder: const CircleBorder(),
            child: Container(
              padding: EdgeInsets.all(10.r),
              child: SvgPicture.asset(
                Constants.cancelIcon,
                width: 20.w,
                height: 20.h,
                color: theme.textTheme.bodyMedium!.color,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
