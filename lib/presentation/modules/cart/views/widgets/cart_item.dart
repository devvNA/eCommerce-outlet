// ignore_for_file: unused_local_variable

import 'package:get/get.dart';
// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:marvelindo_outlet/data/models/keranjang/keranjang_model.dart';
import 'package:marvelindo_outlet/presentation/global/theme/my_colors.dart';
import '../../controllers/cart_controller.dart';

class CartItem extends GetView<CartController> {
  final Keranjang keranjang;
  // final Produk produk;
  const CartItem({
    super.key,
    required this.keranjang,
  });

  @override
  Widget build(BuildContext context) {
    TextEditingController quantityController =
        TextEditingController(text: keranjang.quantity.toString());

    return Container(
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: const BorderRadius.all(
          Radius.circular(
            8.0,
          ),
        ),
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
          const SizedBox(
            width: 12.0,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Lorem ipsum dolor sit amet.",
                  style: TextStyle(
                    fontSize: 14.0,
                  ),
                ),
                const SizedBox(
                  height: 6.0,
                ),
                const Text(
                  "Voucher",
                  style: TextStyle(color: AppColors.appBarColor, fontSize: 10),
                ),
                const SizedBox(
                  height: 6.0,
                ),
                const Text(
                  "Rp5000",
                  style: TextStyle(
                    fontSize: 12.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 6.0,
                ),
                Row(
                  children: [
                    InkWell(
                      onTap: () {},
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
                    const SizedBox(
                      width: 60,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 8.0, vertical: 8.0),
                        child: TextField(
                          clipBehavior: Clip.antiAlias,
                          textAlign: TextAlign.center,
                          maxLines: 1,
                          decoration: InputDecoration(
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
                      onTap: () {},
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
