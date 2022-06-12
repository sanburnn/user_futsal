import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:user_futsal/src/router/constant.dart';
import 'package:user_futsal/src/router/router.dart' as RouterGen;
import 'package:user_futsal/src/router/router.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Puspa Agro',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: rootRoute,
      getPages: routes,
    );
  }
}
