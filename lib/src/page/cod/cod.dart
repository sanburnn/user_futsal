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
            onPressed: () => Get.offAllNamed(mainNavigationRoute),
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
      body: Container(
        padding: EdgeInsets.only(left: 15, right: 15),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 15, right: 15, top: 80),
              child: Text(
                'Segera melakukan pembayaran DP/FULL langsung ditempat\nBatas Waktu Pembayaran Setelah Pesan lapangan ini ialah :',
                style: GoogleFonts.poppins(
                  textStyle:
                      TextStyle(fontWeight: FontWeight.w600, fontSize: 17),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: EdgeInsets.only(left: 15, right: 15),
              child: Text(
                '1 Jam\nMelebihi Batas itu pesanan akan dibatalkan',
                style: GoogleFonts.poppins(
                  textStyle:
                      TextStyle(fontWeight: FontWeight.w600, fontSize: 17),
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 45,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                    primary: primaryColorDark,
                    onPrimary: Colors.white, // foreground
                  ),
                  onPressed: () => Get.offAllNamed(mainNavigationRoute),
                  child: Text(
                    'Kembali ke Depan',
                    style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                      fontSize: 15,
                    )),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
