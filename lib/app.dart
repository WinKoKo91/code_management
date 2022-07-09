import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getx_template/app/bindings/initial_binding.dart';
import 'package:get/get.dart';

import 'app/core/config/build_config.dart';
import 'app/core/config/env_config.dart';
import 'app/core/values/app_colors.dart';
import 'app/data/services/messaging_service.dart';
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

    MessagingService.initalize(onSelectNotification).then(
      (value) => firebaseCloudMessagingListeners(),
    );
  }

  void firebaseCloudMessagingListeners() async {
    MessagingService.onMessage.listen(MessagingService.invokeLocalNotification);
    MessagingService.onMessageOpenedApp.listen(_pageOpenForOnLaunch);
  }

  _pageOpenForOnLaunch(RemoteMessage remoteMessage) {
    final Map<String, dynamic> message = remoteMessage.data;
    onSelectNotification(jsonEncode(message));
  }

  Future onSelectNotification(String? payload) async {
    final payloadData = jsonDecode(payload!);
  }

  String? token;

  getToken() async {
    token = (await FirebaseMessaging.instance.getToken())!;
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
