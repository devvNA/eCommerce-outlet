// ignore_for_file: unused_local_variable

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'package:marvelindo_outlet/core/utils/helpers/currency.dart';

import '../../../../global/theme/my_colors.dart';
import '../../controllers/cart_controller.dart';

class CartItem extends GetView<CartController> {
  final String nama;
  final String kategori;
  final int harga;
  final int quantity;
  final void Function()? onIncreasePressed;
  final void Function()? onDecreasePressed;

  const CartItem({
    super.key,
    required this.nama,
    required this.kategori,
    required this.harga,
    required this.quantity,
    this.onIncreasePressed,
    this.onDecreasePressed,
  });

  @override
  Widget build(BuildContext context) {
    TextEditingController quantityController =
        TextEditingController(text: quantity.toString());

    return Container(
      padding: const EdgeInsets.all(12.0),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(
            8.0,
          ),
        ),
        boxShadow: [
          BoxShadow(
            color: Color.fromARGB(25, 0, 0, 0),
            blurRadius: 25,
            offset: Offset(2, -15),
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
          const SizedBox(
            width: 12.0,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  nama,
                  style: const TextStyle(
                    fontSize: 14.0,
                  ),
                ),
                const SizedBox(
                  height: 6.0,
                ),
                Text(
                  kategori,
                  style: const TextStyle(
                      color: AppColors.appBarColor, fontSize: 10),
                ),
                const SizedBox(
                  height: 6.0,
                ),
                Text(
                  CurrencyFormat.convertToIdr(harga),
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
                        child: TextField(
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          controller: quantityController,
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
                          onChanged: (value) {
                            quantityController.text = value;
                          },
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
