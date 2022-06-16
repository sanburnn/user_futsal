import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:user_futsal/src/api/repository.dart';
import 'package:user_futsal/src/model/loginmodel/LoginReqModel.dart';
import 'package:user_futsal/src/router/constant.dart';
import 'package:user_futsal/src/services/themes.dart';

class RegisterController extends GetxController {
  var isLoading = false.obs;

  Future<void> registerUsers(
      String nama, String notelp, String username, String password) async {
    isLoading.value = true;
    final response = await ApiService().loginApp(username, password);
    if (response != null) {
      final prefs = await SharedPreferences.getInstance();
      prefs.setString("Token", response.token!);
      Get.toNamed(mainNavigationRoute);
    } else {
      Get.defaultDialog(
          middleText: "Username atau Password Salah",
          textConfirm: 'OK',
          confirmTextColor: Colors.white,
          buttonColor: primaryColorDark,
          onConfirm: () {
            Get.back();
          });

      isLoading.value = false;
    }
  }
}
