import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/policies_privacy_controller.dart';

class PoliciesPrivacyView extends GetView<PoliciesPrivacyController> {
  const PoliciesPrivacyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        appBar: AppBar(
          systemOverlayStyle: controller.overlay.value,
          title: const Text("Kebijakan Privasi",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              )),
          centerTitle: true,
        ),
        body: Container(
          padding: const EdgeInsets.all(20.0),
          child: const Column(
            children: [
              Text(
                'Kami menghargai kepercayaan Anda dalam menggunakan aplikasi ini. Privasi dan keamanan data Anda adalah prioritas utama bagi kami. Segala informasi yang Anda berikan kepada kami akan kami lindungi dengan ketat dan tidak akan digunakan untuk tujuan yang tidak sesuai.\n\nData pribadi Anda, seperti informasi akun dan detail kontak, akan disimpan dengan aman dan hanya digunakan untuk keperluan operasional aplikasi ini. Kami tidak akan menyebarkan atau menjual data Anda kepada pihak ketiga tanpa izin Anda.\n\nJika Anda memiliki pertanyaan lebih lanjut tentang kebijakan privasi kami atau ingin menghapus informasi yang kami miliki, silahkan hubungi tim dukungan kami melalui menu "Kontak". Terima kasih telah mempercayakan privasi Anda kepada kami.',
                style: TextStyle(
                  fontSize: 15.0,
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
