// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:marvelindo_outlet/app/core/utils/helpers/currency/int_currency.dart';
import 'package:marvelindo_outlet/app/data/models/keranjang/keranjang_model.dart';

class CheckoutProduct extends StatelessWidget {
  Keranjang keranjang;
  final String? imgUrl;
  final String? title;
  final String? description;
  final String? category;
  final String? time;

  CheckoutProduct({
    super.key,
    required this.keranjang,
    this.imgUrl = "",
    this.title = "",
    this.description = "",
    this.category = "",
    this.time = "",
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      borderOnForeground: true,
      elevation: 2.5,
      clipBehavior: Clip.hardEdge,
      child: Column(
        children: [
          Container(
            color: Colors.grey[50],
            padding: const EdgeInsets.all(12),
            child: Row(
              children: [
                Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                        imgUrl!,
                      ),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: const BorderRadius.all(
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
                        title!,
                        style: const TextStyle(
                            fontSize: 14.0, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 6.0,
                      ),
                      Text(
                        description!,
                        style: const TextStyle(
                            fontSize: 12.0,
                            fontWeight: FontWeight.w400,
                            color: Colors.black54),
                      ),
                      const SizedBox(
                        height: 6.0,
                      ),
                      Row(
                        children: [
                          Text(
                            category!,
                            style: const TextStyle(
                              fontSize: 11.0,
                              fontWeight: FontWeight.w500,
                              color: Colors.blue,
                            ),
                          ),
                          const SizedBox(
                            width: 5.0,
                          ),
                          Text(
                            time!,
                            style: const TextStyle(
                              fontSize: 12.0,
                              color: Colors.black38,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Divider(
              color: Colors.grey,
              thickness: 1,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Total Order (${keranjang.quantity}) : ",
                  style: const TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  20000.currencyFormatRp,
                  style: const TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
