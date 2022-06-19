import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:user_futsal/src/config/env.dart';
import 'package:user_futsal/src/services/themes.dart';

class RingkasanPage extends StatefulWidget {
  RingkasanPage({Key? key}) : super(key: key);

  @override
  State<RingkasanPage> createState() => _RingkasanPageState();
}

class _RingkasanPageState extends State<RingkasanPage> {
  var foto = Get.arguments[0];
  var nama = Get.arguments[1];
  var alamat = Get.arguments[2];
  var notelp = Get.arguments[3];
  var jamMulai = Get.arguments[4];
  var jamAkhir = Get.arguments[5];
  var harga = Get.arguments[6];
  var totaljam = Get.arguments[7];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: primaryColorDark),
        backgroundColor: Colors.white,
        title: Text(
          'Ringkasan Order',
          style: GoogleFonts.poppins(
              textStyle: const TextStyle(color: Colors.black)),
        ),
      ),
      body: Container(
        child: ListView(
          children: [
            Container(
              decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(15),
                      bottomRight: Radius.circular(15))),
              padding:
                  EdgeInsets.only(left: 15, right: 15, top: 20, bottom: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: SizedBox(
                      width: 110,
                      height: 120,
                      child: Image.network(
                        BASE_URL_IMAGE_LAP + '/${foto}',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 13,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${nama}',
                        style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.w500)),
                      ),
                      SizedBox(
                        width: 220,
                        child: Text(
                          '${alamat}',
                          style: GoogleFonts.openSans(
                              textStyle: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w400)),
                        ),
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.phone,
                            size: 20,
                          ),
                          SizedBox(
                            width: 7,
                          ),
                          Text(
                            '+ ${notelp}',
                            style: GoogleFonts.openSans(
                                textStyle: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.w400)),
                          )
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, top: 10),
              child: Text(
                'Detail Transaksi',
                style: GoogleFonts.poppins(
                  textStyle:
                      TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, top: 15, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Jam',
                    style: GoogleFonts.openSans(fontSize: 16),
                  ),
                  Text(
                    '13.00 - 15.00',
                    style: GoogleFonts.openSans(fontSize: 16),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, top: 7, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Harga ',
                    style: GoogleFonts.openSans(fontSize: 16),
                  ),
                  Text(
                    'Rp. ${harga * (totaljam.length - 1)} ',
                    style: GoogleFonts.openSans(fontSize: 16),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 2,
              color: Colors.grey.shade300,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, top: 8),
              child: Text(
                'Metode Pembayaran',
                style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w500),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
