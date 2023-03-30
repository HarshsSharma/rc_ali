import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:phone_log/asset_tracker/view/dashboard.dart';
import 'package:phone_log/controller/layout_view_model.dart';
import 'package:phone_log/core/constant/app_colors.dart';
import 'package:phone_log/core/router.dart';
import 'package:phone_log/individual_pages/time_tracking/controller/dashboard_controller.dart';
import 'package:phone_log/individual_pages/time_tracking/controller/time_tracking_controller.dart';
import 'package:provider/provider.dart';

import 'individual_pages/time_tracking/controller/authController.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.dark,
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
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => LayoutViewModel()..checkConnection(),
        ),
        ChangeNotifierProvider(
          create: (context) => TimeTrackingViewModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => AuthViewModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => DashBoardViewModel(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Phone Log',
        theme: ThemeData(
          appBarTheme: const AppBarTheme(
            elevation: 0,
            toolbarHeight: 0,
          ),
          scaffoldBackgroundColor: AppColors.scaffoldBG,
          primarySwatch: Colors.blue,
        ),
        //home: const TimeOff(),
        //home: const TimeTracking(),
        home: const DashBoard(),
        //home: AbsenseScreen(),
        //home: const LoginScreen(),
        // onGenerateRoute: appRouter.onGenerateRoute,
      ),
    );
  }
}
