import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:user_futsal/src/api/repository.dart';
import 'package:user_futsal/src/services/themes.dart';
import 'package:image_picker/image_picker.dart';

class UploadBuktiController extends GetxController {
  var isLoading = false.obs;
  var imageURL = '';

  Future<void> uploadImage(ImageSource imageSource, String id) async {
    try {
      final pickedFile = await ImagePicker().pickImage(source: imageSource);
      isLoading(true);
      if (pickedFile != null) {
        var response = await ApiService().uploadBukti(pickedFile.path, id);

        if (response != null) {
          Get.snackbar('Success', 'Image uploaded successfully',
              margin: EdgeInsets.only(top: 5, left: 10, right: 10));
        } else {
          Get.rawSnackbar(
              message: 'Failed',
              margin: EdgeInsets.only(top: 5, left: 10, right: 10));
        }
      } else {
        Get.snackbar('Failed', 'Image not selected',
            margin: EdgeInsets.only(top: 5, left: 10, right: 10));
      }
    } finally {
      isLoading(false);
    }
  }
}
