import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:user_futsal/src/services/themes.dart';

class UploadBuktiPage extends StatefulWidget {
  UploadBuktiPage({Key? key}) : super(key: key);

  @override
  State<UploadBuktiPage> createState() => _UploadBuktiPageState();
}

class _UploadBuktiPageState extends State<UploadBuktiPage> {
  var bukti = Get.arguments[0];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: primaryColorDark,
        ),
        title: Text(
          'Bukti Pembayaran',
          style: GoogleFonts.poppins(
            textStyle: TextStyle(fontWeight: FontWeight.w500),
          ),
        ),
      ),
      body: Container(),
    );
  }
}
