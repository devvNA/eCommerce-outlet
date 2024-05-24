// ignore_for_file: unused_local_variable, must_be_immutable
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marvelindo_outlet/app/core/utils/helpers/currency/int_currency.dart';

import '../../../../../data/models/keranjang/keranjang_model.dart';
import '../../../../global/theme/my_colors.dart';

class CartItem extends StatelessWidget {
  Keranjang item;
  final void Function()? onDeacreasePressed;
  void Function(String)? onChanged;
  final void Function()? onIncreasePressed;
  final void Function()? onDeletePressed;
  final TextEditingController? quantityController;

  CartItem({
    super.key,
    required this.item,
    this.onIncreasePressed,
    this.onDeacreasePressed,
    this.onDeletePressed,
    this.onChanged,
    this.quantityController,
  });

  @override
  Widget build(BuildContext context) {
    return Ink(
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
                Text(
                  item.namaBarang ?? "Lorem Ipsum",
                  style: const TextStyle(
                    fontSize: 14.0,
                  ),
                ),
                const SizedBox(
                  height: 6.0,
                ),
                Text(
                  item.jenisBarang ?? "Voucher",
                  style: const TextStyle(
                      color: AppColors.appBarColor, fontSize: 10.5),
                ),
                6.verticalSpace,
                Text(
                  item.hargaBarang!.currencyFormatRp,
                  style: const TextStyle(
                      fontSize: 14.5,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF2C47A3)),
                ),
                const SizedBox(
                  height: 6.0,
                ),
                Row(
                  children: [
                    GestureDetector(
                      onTap: onDeacreasePressed,
                      child: Container(
                        padding: const EdgeInsets.all(5.0),
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
                    SizedBox(
                      width: 65,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8.0, vertical: 8.0),
                        child: TextFormField(
                          controller: quantityController,
                          style: const TextStyle(
                            fontSize: 14,
                          ),
                          onChanged: onChanged,
                          keyboardType: TextInputType.number,
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
                    GestureDetector(
                      onTap: onIncreasePressed,
                      child: Container(
                        padding: const EdgeInsets.all(5.0),
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
          InkWell(
            borderRadius: BorderRadius.circular(4.0),
            onTap: onDeletePressed,
            child: Icon(
              Icons.delete_forever,
              size: 21.0,
              color: Colors.red[800],
            ),
          ),
        ],
      ),
    );
  }
}
