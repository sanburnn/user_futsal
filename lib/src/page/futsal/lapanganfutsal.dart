import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:user_futsal/src/config/env.dart';
import 'package:user_futsal/src/router/constant.dart';
import 'package:user_futsal/src/services/assets.dart';
import 'package:user_futsal/src/services/themes.dart';

class LapanganFutsal extends StatefulWidget {
  LapanganFutsal({Key? key}) : super(key: key);

  @override
  State<LapanganFutsal> createState() => _LapanganFutsalState();
}

class _LapanganFutsalState extends State<LapanganFutsal> {
  var idLap = Get.arguments[0];
  var foto = Get.arguments[1];
  var nama = Get.arguments[2];
  var deskripsi = Get.arguments[3];
  var alamat = Get.arguments[4];
  var notelp = Get.arguments[5];
  var harga = Get.arguments[6];
  var rekening = Get.arguments[7];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: primaryColorDark),
        backgroundColor: Colors.white,
        title: Text(
          'Lapangan Futsal',
          style: GoogleFonts.poppins(
              textStyle: const TextStyle(color: Colors.black)),
        ),
      ),
      body: Container(
        child: ListView(
          children: [
            CachedNetworkImage(
              imageUrl: BASE_URL_IMAGE_LAP + "/${foto}",
              imageBuilder: (context, imageProvider) => Container(
                height: 250,
                decoration: BoxDecoration(
                    image: DecorationImage(image: imageProvider),
                    borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30))),
              ),
              placeholder: (context, url) => Container(
                height: 250,
                child: const Center(
                    child: CircularProgressIndicator(
                  color: primaryColorDark,
                )),
              ),
              errorWidget: (context, url, error) =>
                  const Center(child: Icon(Icons.error)),
            ),
            // Container(
            //   height: 250,
            //   decoration: BoxDecoration(
            //       image: DecorationImage(
            //           image: NetworkImage(BASE_URL_IMAGE_LAP + "/${foto}")),
            //       color: Colors.white,
            //       borderRadius: const BorderRadius.only(
            //           bottomLeft: Radius.circular(30),
            //           bottomRight: Radius.circular(30))),
            // ),
            const SizedBox(
              height: 8,
            ),
            Container(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 180,
                    height: 60,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 5, bottom: 10),
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12)),
                            primary: primaryColorDark,
                            onPrimary: Colors.white, // foreground
                          ),
                          onPressed: () => Get.toNamed(pertandinganRoute,
                              arguments: [idLap]),
                          child: Row(
                            children: [
                              const Icon(
                                Icons.screen_search_desktop_outlined,
                                size: 30,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                'Jadwal \nPertandingan',
                                style: GoogleFonts.poppins(
                                    textStyle: const TextStyle(
                                  fontSize: 13,
                                )),
                              ),
                            ],
                          )),
                    ),
                  ),
                  Container(
                    width: 180,
                    height: 60,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 5, bottom: 10),
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12)),
                            primary: primaryColorDark,
                            onPrimary: Colors.white, // foreground
                          ),
                          onPressed: () =>
                              Get.toNamed(fasilitasRoute, arguments: [idLap]),
                          child: Row(
                            children: [
                              Image.asset(
                                logoFasilitas,
                                height: 40,
                              ),
                              Text(
                                'Fasilitas',
                                style: GoogleFonts.poppins(
                                    textStyle: const TextStyle(
                                  fontSize: 17,
                                )),
                              ),
                            ],
                          )),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 15, right: 15),
              alignment: Alignment.topLeft,
              height: 60,
              child: Row(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          child: Text('Harga Per jam',
                              style: GoogleFonts.poppins(
                                  textStyle: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600)))),
                      Text(
                        'Rp.${harga}',
                        style: GoogleFonts.poppins(),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                          child: Text('Nomor Telpon',
                              style: GoogleFonts.poppins(
                                  textStyle: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600)))),
                      Row(
                        children: [
                          const Icon(
                            Icons.phone_forwarded_rounded,
                            size: 20,
                            color: primaryColorDark,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            "+${notelp.toString()}",
                            style: GoogleFonts.poppins(),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                  color: primaryColor, borderRadius: BorderRadius.circular(17)),
              height: 200,
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.all(13),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    nama,
                    style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                            fontSize: 17, fontWeight: FontWeight.w500)),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  SizedBox(
                    width: 310,
                    child: Text(
                      deskripsi,
                      style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                              fontSize: 13, fontWeight: FontWeight.w500)),
                    ),
                  ),
                  Text(
                    "Alamat",
                    style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w500)),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  SizedBox(
                    width: 310,
                    child: Text(
                      alamat,
                      style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                              fontSize: 13, fontWeight: FontWeight.w500)),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 65,
                child: Padding(
                  padding: const EdgeInsets.only(top: 5, bottom: 10),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12)),
                        primary: primaryColorDark,
                        onPrimary: Colors.white, // foreground
                      ),
                      onPressed: () => Get.toNamed(bookingRoute, arguments: [
                            idLap,
                            nama,
                            foto,
                            alamat,
                            notelp,
                            harga,
                            rekening
                          ]),
                      child: Text(
                        'Booking Lapangan',
                        style: GoogleFonts.poppins(
                            textStyle: const TextStyle(
                          fontSize: 15,
                        )),
                      )),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
