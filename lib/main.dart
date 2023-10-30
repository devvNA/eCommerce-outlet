import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:marvelindo_outlet/presentation/global/dependency_injection/bindings.dart';

import 'utils/my_shared_pref.dart';
import 'presentation/global/theme/my_theme.dart';
import 'presentation/routes/app_pages.dart';

void main() async {
  // wait for bindings
  WidgetsFlutterBinding.ensureInitialized();

  // init shared preference
  await MySharedPref.init();

  //Firebase Config
  await Firebase.initializeApp();

  // Membuat instance dari class AppBindings
  await AppBindings().dependencies();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    //Screen Orientation
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        useInheritedMediaQuery: true,
        rebuildFactor: (old, data) => true,
        builder: (context, widget) {
          return GetMaterialApp(
            title: "Outlet Commerce",
            useInheritedMediaQuery: true,
            debugShowCheckedModeBanner: false,
            builder: (context, widget) {
              bool themeIsLight = MySharedPref.getThemeIsLight();
              return Theme(
                data: MyTheme.getThemeData(isLight: themeIsLight),
                child: MediaQuery(
                  data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
                  child: widget ?? const SizedBox(),
                ),
              );
            },
            initialRoute:
                AppPages.INITIAL, // first screen to show when app is running
            getPages: AppPages.routes, // app screens
          );
        });
  }
}
