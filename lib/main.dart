import 'package:flutter/material.dart';
import 'package:wm_hotel/core/routing/router.dart';
import 'package:wm_hotel/core/services/services_locator.dart';
import 'package:wm_hotel/core/utils/app_colors.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupServiceLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'White Moon Hotel',
      routerConfig: AppRouter.router,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(scaffoldBackgroundColor: AppColors.backgroundColor),
    );
  }
}
