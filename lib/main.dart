// ignore_for_file: deprecated_member_use

import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:marvelindo_outlet/app/presentation/global/dependency_injection/bindings.dart';
import 'package:marvelindo_outlet/app/presentation/global/theme/my_theme.dart';
import 'package:marvelindo_outlet/app/routes/app_pages.dart';
import 'package:marvelindo_outlet/firebase_options.dart';

void main() async {
  // wait for bindings
  WidgetsFlutterBinding.ensureInitialized();
  // init shared preference
  await GetStorage.init();
  //Firebase Config
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(DevicePreview(builder: (context) {
    return const MyApp();
  }));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  static GlobalKey<NavigatorState> globalKey = GlobalKey<NavigatorState>();

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late final StreamSubscription _connectivityStream;

  @override
  void dispose() {
    checkInitialInternetConnection();
    _connectivityStream.cancel();
    super.dispose();
  }

  @override
  void initState() {
    checkInitialInternetConnection();
    super.initState();
  }

  void checkInitialInternetConnection() async {
    final result = await Connectivity().checkConnectivity();
    handleConnectivityStates(result.first);
  }

  void handleConnectivityStates(ConnectivityResult status) {
    if (status != ConnectivityResult.mobile &&
        status != ConnectivityResult.wifi) {
      Get.showSnackbar(const GetSnackBar(
        title: "Tidak ada koneksi",
        message: "Periksa jaringan anda",
        padding: EdgeInsets.all(12.0),
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 25),
        backgroundColor: Colors.redAccent,
        icon: Icon(
          Icons.error,
          color: Colors.white,
        ),
        isDismissible: false,
      ));
    } else {
      if (Get.isSnackbarOpen) {
        Get.closeAllSnackbars();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    //Screen Orientation
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
            navigatorKey: MyApp.globalKey,
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
