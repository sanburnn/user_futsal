import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:user_futsal/src/api/repository.dart';
import 'package:user_futsal/src/router/constant.dart';
import 'package:user_futsal/src/services/themes.dart';

class RegisterController extends GetxController {
  var isLoading = false.obs;

  Future<void> registerUsers(
      String nama, String notelp, String username, String password) async {
    isLoading.value = true;
    final response =
        await ApiService().register(nama, notelp, username, password);
    if (response != null) {
      Get.rawSnackbar(message: "Anda Berhasil Register");
      Get.offAndToNamed(loginRoute);
    } else {
      Get.defaultDialog(
          middleText: "Something wrong, contact admin",
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
