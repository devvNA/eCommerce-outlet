// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:marvelindo_outlet/presentation/global/theme/light_theme_colors.dart';
import 'package:marvelindo_outlet/utils/currency.dart';

import '../../../../../data/models/product_model.dart';
import '../../../../../utils/constants.dart';
import '../../controllers/cart_controller.dart';

class CartItem extends GetView<CartController> {
  final ProductModel product;
  // final Produk produk;
  const CartItem({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    TextEditingController quantityController =
        TextEditingController(text: product.quantity.toString());

    final theme = context.theme;

    return Row(
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
                bottom: 0,
                top: 0,
                left: 0,
                right: 0,
                child: Image.asset(
                  "assets/images/product2.png",
                  width: 100.0,
                  height: 100.0,
                  fit: BoxFit.cover,
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
            RichText(
              text: TextSpan(
                style: DefaultTextStyle.of(context).style,
                children: <TextSpan>[
                  const TextSpan(
                    text: 'jenis: ',
                  ),
                  TextSpan(
                      text: 'Perdana',
                      style:
                          theme.textTheme.bodyLarge?.copyWith(fontSize: 12.sp)),
                ],
              ),
            ),
            5.verticalSpace,
            Text(
              CurrencyFormat.convertToIdr(product.price, 0),
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
                    child: SvgPicture.asset(
                      Constants.decreaseIcon,
                      color: LightThemeColors.primaryColor,
                    ),
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
                      onFieldSubmitted: (value) async {
                        await Future.delayed(const Duration(milliseconds: 300));
                        controller.onInputQuantity(
                            product.id!, int.parse(value));
                      },
                    ),
                  ),
                  10.horizontalSpace,
                  GestureDetector(
                    onTap: () => controller.onIncreasePressed(product.id!),
                    child: SvgPicture.asset(
                      Constants.increaseIcon,
                      color: LightThemeColors.primaryColor,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        const Spacer(),
        InkWell(
          onTap: () async {
            await showDialog<void>(
              context: context,
              barrierDismissible: true,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: const Text('Konfirmasi'),
                  content: const SingleChildScrollView(
                    child: ListBody(
                      children: <Widget>[
                        Text('Hapus produk dari keranjang?'),
                      ],
                    ),
                  ),
                  actions: <Widget>[
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: LightThemeColors.primaryColor,
                        side: const BorderSide(
                          color: LightThemeColors.primaryColor,
                        ),
                      ),
                      onPressed: () {
                        Get.back();
                      },
                      child: const Text("Tidak"),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        controller.onDeletePressed(product.id!);
                        Get.back();
                      },
                      child: const Text("Ya"),
                    ),
                  ],
                );
              },
            );
          },
          customBorder: const CircleBorder(),
          child: Container(
            padding: EdgeInsets.all(12.r),
            child: SvgPicture.asset(
              Constants.cancelIcon,
              width: 15.w,
              height: 15.h,
              color: theme.textTheme.bodyMedium!.color,
            ),
          ),
        ),
      ],
    );
  }
}
