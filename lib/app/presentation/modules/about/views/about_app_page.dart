import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../controllers/about_app_controller.dart';
import '../../../global/widgets/expansion_widget.dart';

class AboutAppView extends GetView<AboutAppController> {
  const AboutAppView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tentang Aplikasi",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            )),
        centerTitle: true,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            Container(
              padding: const EdgeInsets.all(20.0),
              decoration: const BoxDecoration(),
              child: InteractiveViewer(
                clipBehavior: Clip.antiAlias,
                constrained: true,
                child: Image.asset(
                  "assets/icons/mv-logo.png",
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const Center(
              child: Text(
                "Logo CV Marvelindo Utama",
                style: TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
            20.verticalSpace,
            const Text(
              "Selamat datang di Aplikasi MV Shop. Aplikasi ini merupakan solusi terintegrasi untuk memudahkan transaksi antara pelanggan dengan perusahaan. Dengan fitur-fitur yang disediakan, kami bertujuan untuk mempercepat dan mempermudah proses bisnis serta memberikan informasi yang relevan.\n Di dalam aplikasi ini, Anda akan menemukan beberapa menu utama yang memuat fitur-fitur berikut:",
              style: TextStyle(
                fontSize: 15.0,
              ),
            ),
            15.verticalSpace,
            Column(
              children: List.generate(controller.features.length, (index) {
                final fitur = controller.features[index];
                return Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: ExpansionFeatures(
                    title: fitur["title"],
                    description: fitur["description"],
                  ),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}

