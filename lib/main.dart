import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'view/friend_request_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
      SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(statusBarColor: Colors.white, statusBarIconBrightness: Brightness.dark, statusBarBrightness: Brightness.light));
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    final mediaQueryData = MediaQuery.of(context);
    final scale = mediaQueryData.textScaler.clamp(
      minScaleFactor: 1.0, // Minimum scale factor allowed.
      maxScaleFactor: 1.1, // Maximum scale factor allowed.
    );
    return ScreenUtilInit(
      designSize: const Size(
        375,
        812,
      ),
      minTextAdapt: true,
      builder: (_, __) => MediaQuery(
        data: mediaQueryData.copyWith(
          textScaler: scale,
        ),
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Friend App',
        initialRoute: '/',
        getPages: [
          GetPage(name: '/', page: () => FriendRequestPage()),
        ],
      ),
      ),
    );
  }
}
