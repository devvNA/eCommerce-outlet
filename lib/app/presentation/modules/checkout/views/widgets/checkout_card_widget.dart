// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marvelindo_outlet/app/core/utils/helpers/currency/int_currency.dart';
import 'package:marvelindo_outlet/app/core/utils/helpers/date_time_ext.dart';

class CheckoutProduct extends StatelessWidget {
  final String? imgUrl;
  final String? title;
  final String? description;
  final String? category;
  final int? quantity;
  final int? totalPayment;

  const CheckoutProduct({
    super.key,
    this.imgUrl = "",
    this.title = "",
    this.description = "",
    this.category = "",
    this.quantity,
    this.totalPayment,
  });

  @override
  Widget build(BuildContext context) {
    // final time = DateFormat('dd/MM/yyyy, HH:mm:ss').format(DateTime.now());

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
                      Text(
                        category!,
                        style: const TextStyle(
                          fontSize: 11.0,
                          fontWeight: FontWeight.w500,
                          color: Colors.blue,
                        ),
                      ),
                      5.verticalSpace,
                      Text(
                        DateTime.now().toFormattedDatetime(),
                        style: const TextStyle(
                          fontSize: 12.0,
                          color: Colors.black38,
                        ),
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
                  "Total Order ($quantity item) : ",
                  // "Total Order (${keranjang.quantity} item) : ",
                  style: const TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  "${totalPayment?.currencyFormatRp}",
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
