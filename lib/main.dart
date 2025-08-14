import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'features/home/view/screen/home.dart';
import 'package:BMI_Calculator/features/home/view/screen/screen2.dart';
import 'package:BMI_Calculator/features/home/view/screen/result.dart';

void main() => runApp(
  DevicePreview(enabled: !kReleaseMode, builder: (context) => MyApp()),
);

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      debugShowCheckedModeBanner: false,
      builder: DevicePreview.appBuilder,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      initialRoute: Home.routeName,

      routes: {
        Home.routeName: (context) => Home(),
        Home2.routeName: (context) => Home2(),
        Home3.routeName: (context) => Home3(),
      },
    );
  }
}
