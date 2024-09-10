import 'package:flutter/material.dart';
import 'package:fluxstore/app/routes/app_pages.dart';
import 'package:fluxstore/config/app_theme.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FluxStore',
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      theme: AppThemes.lightTheme,
      darkTheme: AppThemes.darkTheme,
      themeMode: ThemeMode.light,
    );
  }
}
