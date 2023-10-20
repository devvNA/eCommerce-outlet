import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:marvelindo_outlet/presentation/global/theme/light_theme_colors.dart';
import 'package:marvelindo_outlet/presentation/routes/app_pages.dart';

import '../../global/common/screen_title.dart';
import 'checkout_controller.dart';

class CheckoutView extends GetView<CheckoutController> {
  const CheckoutView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: GetBuilder<CheckoutController>(builder: (context) {
      return SafeArea(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 16, left: 16, right: 16),
              child: ScreenTitle(
                automaticallyImplyLeading: false,
                title: 'Checkout',
              ),
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.all(16.0),
                width: Get.width,
                child: RefreshIndicator(
                  color: LightThemeColors.primaryColor,
                  onRefresh: () async {},
                  child: ListView(
                    children: [
                      Row(
                        children: [
                          const Icon(
                            Icons.location_on_outlined,
                            size: 25.0,
                            color: Colors.black,
                          ),
                          5.horizontalSpace,
                          const Text(
                            "Alamat Pengiriman",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 14.0,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                      5.verticalSpace,
                      Card(
                        clipBehavior: Clip.antiAlias,
                        elevation: 1,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 5),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    "Alamat :",
                                    style: TextStyle(
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                      Icons.edit_location_alt,
                                      size: 15.0,
                                      color: Colors.black87,
                                    ),
                                  ),
                                ],
                              ),
                              const Padding(
                                padding: EdgeInsets.only(right: 20),
                                child: Text(
                                  softWrap: true,
                                  "216 St Paul's Rd, London N1 2LL, UK Contact :  +44-784232",
                                  style: TextStyle(
                                    fontSize: 14.0,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      20.verticalSpace,
                      Row(
                        children: [
                          const Icon(
                            Icons.list_alt,
                            size: 25.0,
                            color: Colors.black,
                          ),
                          5.horizontalSpace,
                          const Text(
                            "Detail Pemesanan",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 14.0,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                      5.verticalSpace,
                      const CheckoutProduct(
                        imgUrl: "https://picsum.photos/1000",
                        title: "Perdana 5GB",
                        description: "Harga satuan:\nRp10.000",
                        category: "Perdana",
                      ),
                      const SizedBox(
                        height: 6.0,
                      ),
                      const CheckoutProduct(
                        imgUrl: "https://picsum.photos/1000",
                        title: "Perdana 5GB",
                        description: "Harga satuan:\nRp10.000",
                        category: "Voucher",
                      ),
                      const SizedBox(
                        height: 6.0,
                      ),
                      const CheckoutProduct(
                        imgUrl: "https://picsum.photos/1000",
                        title: "Perdana 5GB",
                        description: "Harga satuan:\nRp10.000",
                        category: "Voucher",
                      ),
                      const SizedBox(
                        height: 5.0,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(16.0),
              height: 80.0,
              decoration: BoxDecoration(
                boxShadow: const [
                  BoxShadow(
                      color: Color.fromARGB(27, 0, 0, 0),
                      offset: Offset(1, -1),
                      blurRadius: 10),
                ],
                color: Colors.grey[100],
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
              ),
              child: SizedBox(
                child: Row(
                  children: [
                    const Expanded(
                      flex: 2,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Total Pembayaran",
                            style: TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "Rp60.000",
                            style: TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 10.0,
                    ),
                    Expanded(
                      flex: 2,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        onPressed: () {
                          Get.toNamed(Routes.PAYMENT);
                        },
                        child: const Text(
                          "Pilih Pembayaran",
                          style: TextStyle(
                            fontSize: 14.0,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }));
  }
}

class CheckoutProduct extends StatelessWidget {
  final String? imgUrl;
  final String? title;
  final String? description;
  final String? category;
  final String? time;

  const CheckoutProduct({
    super.key,
    this.imgUrl = "",
    this.title = "",
    this.description = "",
    this.category = "",
    this.time = "",
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
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
                            fontSize: 16.0, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 6.0,
                      ),
                      Text(
                        description!,
                        style: const TextStyle(
                            fontSize: 14.0,
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
                              fontSize: 14.0,
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
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Total Order (2) : ",
                  style: TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  "Rp20.000",
                  style: TextStyle(
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
