import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:user_futsal/src/router/constant.dart';
import 'package:user_futsal/src/services/themes.dart';

class SuksesPage extends StatefulWidget {
  SuksesPage({Key? key}) : super(key: key);

  @override
  State<SuksesPage> createState() => _SuksesPageState();
}

class _SuksesPageState extends State<SuksesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: primaryColorDark),
        backgroundColor: Colors.white,
        leading: IconButton(
            onPressed: () => Get.offAndToNamed(mainNavigationRoute),
            icon: Icon(Icons.arrow_back)),
        title: Text(
          'Sukses',
          style: GoogleFonts.poppins(
              textStyle:
                  TextStyle(fontWeight: FontWeight.w500, color: Colors.black)),
        ),
      ),
      body: Container(),
    );
  }
}
