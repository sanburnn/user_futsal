import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:user_futsal/src/api/repository.dart';

import 'package:user_futsal/src/services/themes.dart';

class CreateTrxController extends GetxController {
  var isLoading = false.obs;

  Future<void> createTrx(String idfutsal, String idpengguna, String nama,
      String notelp, String jam, String tanggal, String status) async {
    isLoading.value = true;
    final response = await ApiService().createTransaksi(
        idfutsal, idpengguna, nama, notelp, jam, tanggal, status);
    if (response != null) {
      Get.rawSnackbar(message: "Berhasil Memesan");
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
