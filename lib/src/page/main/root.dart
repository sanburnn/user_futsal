import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:user_futsal/src/router/constant.dart';
import 'package:user_futsal/src/services/assets.dart';

class Root extends StatefulWidget {
  Root({Key? key}) : super(key: key);

  @override
  State<Root> createState() => _RootState();
}

class _RootState extends State<Root> {
  @override
  void initState() {
    super.initState();
    _init();
  }

  void _init() {
    Timer(const Duration(seconds: 2), () {
      // if (user != null && user != '') {
      Get.offAndToNamed(loginRoute);
      // } else {
      //   Get.offAndToNamed(LoginUI.routeName);
      // }
      getPref();
    });
  }

  void getPref() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('Token');
    if (token != '' && token != null) {
      Get.offAndToNamed(mainNavigationRoute);
    } else {
      Get.offAndToNamed(loginRoute);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Image.asset(
              logoFutsal,
              width: 180,
            ),
          )
        ],
      ),
    );
  }
}
