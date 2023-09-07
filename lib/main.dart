import 'package:color_demo/config/apppages.dart';
import 'package:color_demo/config/routes.dart';
import 'package:color_demo/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({key});
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: GetMaterialApp(
        title: 'Money Winzo',
        theme: lightThemeData(context),
        scrollBehavior: const ScrollBehavior(),
        darkTheme: darkThemeData(context),
        themeMode: ThemeMode.light,
        debugShowCheckedModeBanner: false,
        getPages: AppPages.pages,
        initialRoute: AppRoutes.splash,
        builder: EasyLoading.init(),
        // home: SplashScreen(),
      ),
    );
  }
}
