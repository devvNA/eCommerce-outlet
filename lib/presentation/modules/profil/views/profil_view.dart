import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../global/common/screen_title.dart';
import '../controllers/profil_controller.dart';

class ProfilView extends GetView<ProfilController> {
  const ProfilView({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> card1 = [
      {
        'name': 'Lorem',
        'subname': 'Lorem: 8.9',
        'color': const Color(0xffFF9500),
        'icon':
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ5Morsj7WTjODQyBFV80YD9CfPQSlv1ddesA&usqp=CAU',
      },
      {
        'name': 'Lorem',
        'subname': 'None',
        'color': const Color(0xffFF3B30),
        'icon':
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ5Morsj7WTjODQyBFV80YD9CfPQSlv1ddesA&usqp=CAU',
      },
      {
        'name': 'Lorem',
        'subname': '',
        'color': const Color(0xff34C759),
        'icon':
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ5Morsj7WTjODQyBFV80YD9CfPQSlv1ddesA&usqp=CAU',
      },
    ];

    return Scaffold(
      backgroundColor: const Color(0xffF3F5F9),
      body: Obx(() {
        return ListView(
          padding: const EdgeInsets.all(30),
          children: [
            20.verticalSpace,
            const ScreenTitle(
              centerTitle: true,
              title: 'Profil',
              dividerEndIndent: 230,
            ),
            10.verticalSpace,
            Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 8.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(124 / 2),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.08),
                          blurRadius: 24,
                          offset: const Offset(0, 8),
                          spreadRadius: 8)
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: CircleAvatar(
                      radius: 30.0,
                      backgroundImage: NetworkImage(
                        "${controller.getDisplayProfile()}",
                      ),
                    ),
                  ),
                ),
                Text(
                  "${controller.getUsername()}",
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 3.0,
                ),
                Text(
                  "${controller.getEmail()}",
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey[650],
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    controller.onTapButton();
                  },
                  child: const Text("Token"),
                ),
                10.verticalSpace,
                const Divider(thickness: 1),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Card(
                      color: Color(0xff34C759),
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: 12.0,
                          right: 12.0,
                          top: 4.0,
                          bottom: 4.0,
                        ),
                        child: Text(
                          "Lorem: ",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12.0,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 4,
                    ),
                    Card(
                      color: Color(0xffAF52DE),
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: 12.0,
                          right: 12.0,
                          top: 4.0,
                          bottom: 4.0,
                        ),
                        child: Text(
                          "Lorem: ",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12.0,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const Divider(
                  thickness: 1,
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 12.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.08),
                          blurRadius: 24,
                          offset: const Offset(0, 8),
                          spreadRadius: 8)
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Information",
                          style: TextStyle(
                            color: const Color(0xff3C3C43).withOpacity(0.6),
                            fontSize: 13,
                          ),
                        ),
                        const SizedBox(
                          height: 12.0,
                        ),
                        Column(
                          children: card1.map(
                            (e) {
                              return SizedBox(
                                height: 50,
                                child: Material(
                                  color: Colors.white,
                                  child: InkWell(
                                    onTap: () {},
                                    child: Container(
                                      padding: const EdgeInsets.all(6.0),
                                      child: Row(
                                        children: [
                                          Container(
                                              height: 28,
                                              width: 28,
                                              padding:
                                                  const EdgeInsets.all(5.5),
                                              decoration: BoxDecoration(
                                                color: e['color'],
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                              child: Image.network(e['icon'])),
                                          const SizedBox(width: 16),
                                          Text(
                                            e['name'],
                                            style: const TextStyle(
                                              fontSize: 17,
                                            ),
                                          ),
                                          const Spacer(),
                                          Text(
                                            e['subname'],
                                            style: TextStyle(
                                              color: const Color(0xff3C3C43)
                                                  .withOpacity(0.6),
                                              fontSize: 17,
                                            ),
                                          ),
                                          const SizedBox(width: 6),
                                          const Icon(
                                            Icons.chevron_right,
                                            size: 24,
                                            color: Color(0xffD1D1D6),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ).toList(),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                const SizedBox(
                  height: 16,
                ),
              ],
            ),
          ],
        );
      }),
    );
  }
}
