import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:user_futsal/src/router/constant.dart';
import 'package:user_futsal/src/services/themes.dart';

class CodPage extends StatefulWidget {
  CodPage({Key? key}) : super(key: key);

  @override
  State<CodPage> createState() => _CodPageState();
}

class _CodPageState extends State<CodPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: primaryColorDark),
        leading: IconButton(
            onPressed: () => Get.offAndToNamed(mainNavigationRoute),
            icon: Icon(Icons.arrow_back)),
        backgroundColor: Colors.white,
        title: Text(
          'COD',
          style: GoogleFonts.poppins(
            textStyle:
                TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
          ),
        ),
      ),
      body: Container(),
    );
  }
}
