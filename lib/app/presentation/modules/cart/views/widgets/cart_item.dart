// ignore_for_file: unused_local_variable, must_be_immutable
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:marvelindo_outlet/app/core/utils/helpers/currency/int_currency.dart';

import '../../../../global/theme/my_colors.dart';
import '../../controllers/cart_controller.dart';

class CartItem extends GetView<CartController> {
  String? namaProduk;
  final void Function()? onIncreasePressed;
  final void Function()? onDecreasePressed;
  final void Function()? onDeletePressed;
  final void Function(String)? onChanged;
  String? initialValue;

  CartItem({
    super.key,
    this.namaProduk,
    this.onIncreasePressed,
    this.onDecreasePressed,
    this.onDeletePressed,
    this.onChanged,
    this.initialValue,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(
            8.0,
          ),
        ),
        boxShadow: [
          BoxShadow(
            color: Color.fromARGB(27, 0, 0, 0),
            blurRadius: 20,
            offset: Offset(2, -10),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 100,
            height: 125,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/product2.png"),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(
                  8.0,
                ),
              ),
            ),
          ),
          12.horizontalSpace,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                3.verticalSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      namaProduk ?? "Lorem Ipsum",
                      style: const TextStyle(
                        fontSize: 14.0,
                      ),
                    ),
                    GestureDetector(
                      onTap: onDeletePressed,
                      child: const Icon(
                        Icons.cancel_sharp,
                        size: 18.0,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 6.0,
                ),
                const Text(
                  "Voucher",
                  style: TextStyle(color: AppColors.appBarColor, fontSize: 10),
                ),
                6.verticalSpace,
                Text(
                  0.currencyFormatRp,
                  style: const TextStyle(
                    fontSize: 12.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 6.0,
                ),
                Row(
                  children: [
                    Ink(
                      child: InkWell(
                        onTap: onDecreasePressed,
                        child: Container(
                          padding: const EdgeInsets.all(4.0),
                          decoration: const BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.all(
                              Radius.circular(4.0),
                            ),
                          ),
                          child: const Icon(
                            Icons.remove,
                            color: Colors.white,
                            size: 16.0,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 60,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8.0, vertical: 8.0),
                        child: TextFormField(
                          initialValue: initialValue,
                          onChanged: onChanged,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          clipBehavior: Clip.antiAlias,
                          textAlign: TextAlign.center,
                          maxLines: 1,
                          decoration: const InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: AppColors.primaryColor),
                            ),
                            focusColor: Colors.red,
                            border: OutlineInputBorder(),
                            isDense: true, // Added this
                            contentPadding: EdgeInsets.all(6),
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: onIncreasePressed,
                      child: Container(
                        padding: const EdgeInsets.all(4.0),
                        decoration: BoxDecoration(
                          color: AppColors.primaryColor.withOpacity(0.8),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(4.0),
                          ),
                        ),
                        child: const Icon(
                          Icons.add,
                          color: Colors.white,
                          size: 16.0,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
