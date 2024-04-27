// ignore_for_file: deprecated_member_use

import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_core/firebase_core.dart';
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
  //Firebase Config
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  static GlobalKey<NavigatorState> globalKey = GlobalKey<NavigatorState>();

  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late final StreamSubscription _connectivityStream;

  @override
  void initState() {
    checkInitialInternetConnection();
    checkInternetConnectivityStatus();
    super.initState();
  }

  void checkInitialInternetConnection() async {
    final result = await Connectivity().checkConnectivity();
    handleConnectivityStates(result);
  }

  void checkInternetConnectivityStatus() {}

  void handleConnectivityStates(ConnectivityResult status) {
    if (status != ConnectivityResult.mobile &&
        status != ConnectivityResult.wifi) {
      Get.showSnackbar(const GetSnackBar(
        title: 'No internet!',
        message: 'Please check your internet connectivity',
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
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        useInheritedMediaQuery: true,
        rebuildFactor: (old, data) => true,
        builder: (context, widget) {
          return GetMaterialApp(
            theme: MyTheme.getThemeData(),
            navigatorKey: MyApp.globalKey,
            initialBinding:
                // Membuat instance dari class AppBindings
                AppBindings(),
            title: "Outlet e-Commerce",
            useInheritedMediaQuery: true,
            debugShowCheckedModeBanner: false,
            initialRoute: Routes.SPLASH,
            // app screens
            getPages: AppPages.routes,
          );
        });
  }

  @override
  void dispose() {
    _connectivityStream.cancel();
    super.dispose();
  }
}
