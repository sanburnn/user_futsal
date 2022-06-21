import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:user_futsal/src/config/env.dart';
import 'package:user_futsal/src/controller/uploadbukti_controller.dart';
import 'package:user_futsal/src/router/constant.dart';
import 'package:user_futsal/src/services/assets.dart';
import 'package:user_futsal/src/services/themes.dart';
import 'package:image_picker/image_picker.dart';

class UploadBuktiPage extends StatefulWidget {
  UploadBuktiPage({Key? key}) : super(key: key);

  @override
  State<UploadBuktiPage> createState() => _UploadBuktiPageState();
}

class _UploadBuktiPageState extends State<UploadBuktiPage> {
  UploadBuktiController upload = Get.put(UploadBuktiController());
  var bukti = Get.arguments[0];
  var id = Get.arguments[1];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: primaryColorDark,
        ),
        leading: IconButton(
            onPressed: () => Get.offAllNamed(mainNavigationRoute),
            icon: Icon(Icons.arrow_back)),
        backgroundColor: Colors.white,
        title: Text(
          'Bukti Pembayaran',
          style: GoogleFonts.poppins(
            textStyle:
                TextStyle(fontWeight: FontWeight.w500, color: Colors.black),
          ),
        ),
      ),
      body: Container(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Center(
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(12)),
                width: 250,
                height: 200,
                child: bukti != null
                    ? Image.network(
                        BASE_URL_IMAGE_BUKTI + '/${bukti}',
                        fit: BoxFit.fill,
                      )
                    : Image.asset(suksesIcon),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Center(
              child: Container(
                width: 180,
                height: 40,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                      primary: primaryColorDark,
                      onPrimary: Colors.white, // foreground
                    ),
                    onPressed: () {
                      upload.uploadImage(ImageSource.gallery, id);
                    },
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Uplaod Bukti',
                          style: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                            fontSize: 15,
                          )),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        const Icon(
                          Icons.upload_file,
                          size: 20,
                        )
                      ],
                    )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
