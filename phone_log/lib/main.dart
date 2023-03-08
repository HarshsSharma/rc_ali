import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:phone_log/core/constant/app_colors.dart';
import 'package:phone_log/core/router.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
      statusBarBrightness: Brightness.light,
    ),
  );
  runApp(MyApp(
    appRouter: AppRouter(),
  ));
}

class MyApp extends StatelessWidget {
  final AppRouter appRouter;
  const MyApp({required this.appRouter, super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Phone Log',
        theme: ThemeData(
          appBarTheme: const AppBarTheme(elevation: 0, toolbarHeight: 0),
          scaffoldBackgroundColor: AppColors.scaffoldBG,
          primarySwatch: Colors.blue,
        ),
        onGenerateRoute: appRouter.onGenerateRoute);
  }
}
