// ignore_for_file: deprecated_member_use
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:marvelindo_outlet/app/presentation/global/dependency_injection/bindings.dart';
import 'package:marvelindo_outlet/app/presentation/global/theme/my_theme.dart';
import 'package:marvelindo_outlet/app/routes/app_pages.dart';

void main() async {
  // wait for bindings
  WidgetsFlutterBinding.ensureInitialized();
  // init shared preference
  await GetStorage.init();
  //Token Service
  // await Get.putAsync(() async => TokenService().init());
  //Check internet connection
  AppBindings.initConnection();

  //run App
  runApp(
    const MyApp(),
  );
  // runApp(
  //   DevicePreview(
  //     builder: (context) {
  //       return const MyApp();
  //     },
  //   ),
  // );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

    return ScreenUtilInit(
        designSize: const Size(360, 720),
        minTextAdapt: true,
        splitScreenMode: true,
        useInheritedMediaQuery: true,
        builder: (context, widget) {
          return GetMaterialApp(
            theme: MyTheme.getThemeData(),
            initialBinding:
                AppBindings(), // Membuat instance dari class AppBindings
            title: "Outlet e-Commerce",
            useInheritedMediaQuery: true,
            debugShowCheckedModeBanner: false,
            initialRoute: Routes.SPLASH,
            getPages: AppPages.routes,
          );
        });
  }
}
