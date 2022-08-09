import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:user_futsal/src/api/repository.dart';
import 'package:user_futsal/src/services/themes.dart';

class UpdateJamController extends GetxController {
  var isLoading = false.obs;

  Future<void> updateJam(String status, String idjadwal) async {
    isLoading.value = true;
    final response = await ApiService().updateJam(status, idjadwal);
    if (response != null) {
    } else {
      Get.defaultDialog(
          middleText: "Gagal Booking, Try again!",
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
