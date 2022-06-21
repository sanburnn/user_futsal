import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:user_futsal/src/router/constant.dart';
import 'package:user_futsal/src/services/assets.dart';
import 'package:user_futsal/src/services/themes.dart';

class SuksesPage extends StatefulWidget {
  SuksesPage({Key? key}) : super(key: key);

  @override
  State<SuksesPage> createState() => _SuksesPageState();
}

class _SuksesPageState extends State<SuksesPage> {
  var rekening = Get.arguments[0];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: primaryColorDark),
        backgroundColor: Colors.white,
        leading: IconButton(
            onPressed: () => Get.offAllNamed(mainNavigationRoute),
            icon: Icon(Icons.arrow_back)),
        title: Text(
          'Sukses Page',
          style: GoogleFonts.poppins(
              textStyle:
                  TextStyle(fontWeight: FontWeight.w500, color: Colors.black)),
        ),
      ),
      body: Container(
        child: Column(
          children: [
            SizedBox(
              height: 45,
            ),
            Center(
                child: Text(
              'SUKSES!',
              style: GoogleFonts.roboto(
                textStyle: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 27,
                    color: Colors.grey.shade600),
              ),
            )),
            SizedBox(
              height: 20,
            ),
            Center(
              child: Image.asset(
                suksesIcon,
                height: 150,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Segera lakukan Pembayaran DP Sebesar "Rp.50.000" ke nomer rekening dibawah ini: ',
                    style: GoogleFonts.poppins(
                      textStyle:
                          TextStyle(fontWeight: FontWeight.w400, fontSize: 17),
                    ),
                  ),
                  SizedBox(
                    height: 7,
                  ),
                  Text(
                    rekening,
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          color: primaryColorDark),
                    ),
                  ),
                  SizedBox(
                    height: 7,
                  ),
                  Text(
                    'Setelah mentransfer uplaod bukti transfer pada menu upload ',
                    style: GoogleFonts.poppins(
                      textStyle:
                          TextStyle(fontWeight: FontWeight.w400, fontSize: 15),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 38),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 50,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                      primary: primaryColorDark,
                      onPrimary: Colors.white, // foreground
                    ),
                    onPressed: () => Get.offAllNamed(mainNavigationRoute),
                    child: Text(
                      'Kembali ke Depan',
                      style: TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Roboto"),
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
