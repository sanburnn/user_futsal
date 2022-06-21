import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:user_futsal/src/config/env.dart';
import 'package:user_futsal/src/controller/cekuser_controller.dart';
import 'package:user_futsal/src/controller/createTrx_controller.dart';
import 'package:user_futsal/src/router/constant.dart';
import 'package:user_futsal/src/services/themes.dart';

enum SingingCharacter { cod, trf }

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
  var rekening = Get.arguments[8];
  var idLap = Get.arguments[9];
  var tanggal = Get.arguments[10];
  List<String> buttonText = ["cod", "trf"];
  CreateTrxController order = Get.put(CreateTrxController());
  CekuserController cek = Get.put(CekuserController());
  String? _radioValue;

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
                    'Tanggal',
                    style: GoogleFonts.openSans(fontSize: 16),
                  ),
                  Text(
                    tanggal,
                    style: GoogleFonts.openSans(fontSize: 16),
                  ),
                ],
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
                    '${jamMulai} - ${jamAkhir}',
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
                    style: GoogleFonts.openSans(
                        fontWeight: FontWeight.w500, fontSize: 16),
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
            Padding(
              padding: EdgeInsets.only(left: 10, top: 5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: 45,
                    child: RadioListTile(
                      activeColor: primaryColorDark,
                      title: const Text('COD Bayar Ditempat'),
                      value: buttonText[0],
                      groupValue: _radioValue,
                      onChanged: (value) {
                        setState(() {
                          _radioValue = value as String;
                          print(_radioValue);
                        });
                      },
                    ),
                  ),
                  SizedBox(
                    height: 40,
                    child: RadioListTile(
                      activeColor: primaryColorDark,
                      title: const Text('Transfer DP'),
                      value: buttonText[1],
                      groupValue: _radioValue,
                      onChanged: (value) {
                        setState(() {
                          _radioValue = value as String?;
                          print(_radioValue);
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 2,
              color: Colors.grey.shade300,
            ),
            Padding(
              padding: EdgeInsets.only(left: 30, top: 10),
              child: Row(
                children: [
                  Text(
                    '*',
                    style: TextStyle(
                      fontSize: 17,
                      color: Colors.red,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Teliti dahulu sebelum memesan lapangan atau melakukan\n transaksi',
                    style: TextStyle(fontSize: 12, color: Colors.red),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 30, top: 5),
              child: Row(
                children: [
                  Text(
                    '**',
                    style: TextStyle(
                      fontSize: 17,
                      color: Colors.red,
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    'Pemilihan Jam Harus Sesuai, jika tidak sesuai transaksi akan\n di cancel dan lakukan pemesanan ulang kembali',
                    style: TextStyle(fontSize: 12, color: Colors.red),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 60,
            ),
            Container(
              height: 2,
              color: Colors.grey.shade300,
            ),
            Padding(
              padding: EdgeInsets.only(left: 15, right: 15, top: 5),
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Total Bayar',
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.w500),
                      ),
                    ),
                    Text(
                      'Rp. ${harga * (totaljam.length - 1)} ',
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 17,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15, top: 5),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 50,
                child: Padding(
                  padding: const EdgeInsets.only(top: 5, bottom: 10),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12)),
                        primary: primaryColorDark,
                        onPrimary: Colors.white, // foreground
                      ),
                      onPressed: () async {
                        if (_radioValue != null) {
                          if (_radioValue == 'cod') {
                            await order.createTrx(
                                idLap.toString(),
                                cek.cek.value.idPengguna!,
                                cek.cek.value.nama!,
                                notelp.toString(),
                                tanggal,
                                '${jamMulai} - ${jamAkhir}',
                                'cod');
                            Get.offAndToNamed(codRoute);
                          } else {
                            await order.createTrx(
                                idLap.toString(),
                                cek.cek.value.idPengguna!,
                                cek.cek.value.nama!,
                                notelp.toString(),
                                tanggal,
                                '${jamMulai} - ${jamAkhir}',
                                'trfpending');
                            Get.offAndToNamed(suksesRoute,
                                arguments: [rekening]);
                          }
                        } else {
                          Get.rawSnackbar(
                              message: "Pilih Salah Satu Metode Pembayaran",
                              margin: EdgeInsets.only(bottom: 30));
                        }
                      },
                      child: Text(
                        'Pesan',
                        style: GoogleFonts.poppins(
                            textStyle: TextStyle(
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
