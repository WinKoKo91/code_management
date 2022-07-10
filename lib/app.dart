import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getx_template/app/bindings/initial_binding.dart';
import 'package:get/get.dart';

import 'app/core/config/build_config.dart';
import 'app/core/config/env_config.dart';
import 'app/core/values/app_colors.dart';
import 'app/routes/app_pages.dart';
import 'flavors.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  void initState() {
    EnvConfig devConfig = EnvConfig(
      appName: F.title,
      baseUrl: F.baseUrl,
      shouldCollectCrashLog: true,
    );

    BuildConfig.instantiate(
      envType: F.appFlavor!,
      envConfig: devConfig,
    );


  }


  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Application",
      initialRoute: AppPages.INITIAL,
      initialBinding: InitialBinding(),
      getPages: AppPages.routes,
      theme: ThemeData(
        primarySwatch: AppColors.colorPrimarySwatch,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        brightness: Brightness.light,
        primaryColor: AppColors.colorPrimary,
        fontFamily: 'Roboto',
      ),
    );
  }
}
