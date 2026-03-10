import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:noor/app/app.locator.dart';
import 'package:noor/app/app.router.dart';
import 'package:quran_library/quran.dart';
import 'package:stacked_services/stacked_services.dart';

Future<void> main() async {
  await setupLocator();
  await WidgetsFlutterBinding.ensureInitialized();
  await QuranLibrary.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          navigatorKey: StackedService.navigatorKey,
          onGenerateRoute: StackedRouter().onGenerateRoute,
        );
      },
    );
  }
}
