import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:user_futsal/src/controller/cekuser_controller.dart';
import 'package:user_futsal/src/controller/hari_controller.dart';
import 'package:user_futsal/src/controller/jam_controller.dart';
import 'package:user_futsal/src/router/constant.dart';
import 'package:user_futsal/src/services/themes.dart';

class BookingPage extends StatefulWidget {
  BookingPage({Key? key}) : super(key: key);

  @override
  State<BookingPage> createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  HariController hari = Get.put(HariController());
  CekuserController cek = Get.put(CekuserController());
  JamController jam = Get.put(JamController());
  var idLap = Get.arguments[0];
  var nama = Get.arguments[1];
  var foto = Get.arguments[2];
  var alamat = Get.arguments[3];
  var notelp = Get.arguments[4];
  var harga = Get.arguments[5];
  var rekening = Get.arguments[6];
  String? _selectHari;
  String? valueHari;
  List numlist = [1, 2, 3];
  int? _radioValue = -1;
  bool isSelected = false;
  List selectedJam = [];
  bool isTapped = true;
  //*===========range=====

  //*=====================
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    hari.getHari(idLap);
    print(_selectHari);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: primaryColorDark),
        title: Text(
          'Booking Lapangan',
          style: GoogleFonts.poppins(
              textStyle:
                  TextStyle(fontWeight: FontWeight.w500, color: Colors.black)),
        ),
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              color: Colors.grey.shade200,
              padding: const EdgeInsets.only(top: 20, left: 15),
              child: Text(
                'Jadwal',
                style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                      fontWeight: FontWeight.w600, fontSize: 17),
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.only(top: 5, left: 15),
              color: Colors.grey.shade200,
              child: Text(
                'Pilih hari untuk mengetahui jam',
                style: GoogleFonts.poppins(
                  textStyle: const TextStyle(fontSize: 15),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(top: 20),
              height: 80,
              color: Colors.grey.shade200,
              child: Obx(() {
                if (hari.isLoading.value) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  return ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemCount: hari.hari.length + 1,
                      itemBuilder: (context, index) {
                        return index == hari.hari.length
                            ? Padding(
                                padding:
                                    const EdgeInsets.only(left: 10, right: 10),
                                child: Container(
                                  alignment: Alignment.center,
                                  width: 80,
                                  height: 80,
                                  decoration: BoxDecoration(
                                      color: Colors.grey.shade400,
                                      borderRadius: BorderRadius.circular(5)),
                                  child: Text(
                                    'Not Ready Yet',
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.poppins(
                                      textStyle: const TextStyle(
                                          color: Colors.black38,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ),
                                ),
                              )
                            : InkWell(
                                onTap: () => setState(() {
                                  _selectHari = hari.hari[index].idHari;
                                  valueHari = hari.hari[index].tanggal;
                                  _radioValue = index;
                                  selectedJam.clear();
                                  print(_selectHari);
                                  print(valueHari);
                                  jam.getJam(
                                      idLap.toString(), _selectHari.toString());
                                }),
                                child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 10, right: 10),
                                    child: _radioValue == index
                                        ? Container(
                                            alignment: Alignment.center,
                                            width: 80,
                                            height: 80,
                                            decoration: BoxDecoration(
                                                color: primaryColorDark,
                                                border: Border.all(
                                                    color: primaryColorDark,
                                                    width: 1),
                                                borderRadius:
                                                    BorderRadius.circular(5)),
                                            child: Text(
                                              hari.hari[index].tanggal!,
                                              textAlign: TextAlign.center,
                                              style: GoogleFonts.poppins(
                                                textStyle: const TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                            ),
                                          )
                                        : Container(
                                            alignment: Alignment.center,
                                            width: 80,
                                            height: 80,
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                border: Border.all(
                                                    color: primaryColorDark,
                                                    width: 1),
                                                borderRadius:
                                                    BorderRadius.circular(5)),
                                            child: Text(
                                              hari.hari[index].tanggal!,
                                              textAlign: TextAlign.center,
                                              style: GoogleFonts.poppins(
                                                textStyle: const TextStyle(
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                            ),
                                          )),
                              );
                      });
                }
              }),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
              color: Colors.grey.shade200,
              child: Text(
                'Pilih Jam Mulai dan Jam Selesai',
                style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                        fontWeight: FontWeight.w500, fontSize: 15)),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 15, right: 15, top: 10),
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(18),
                    bottomRight: Radius.circular(18)),
              ),
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.grey.shade400,
                        borderRadius: BorderRadius.circular(5)),
                    width: 17,
                    height: 17,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    'Tidak Tersedia',
                    style:
                        GoogleFonts.poppins(textStyle: TextStyle(fontSize: 14)),
                  ),
                  const SizedBox(
                    width: 7,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: primaryColorDark,
                        borderRadius: BorderRadius.circular(5)),
                    width: 17,
                    height: 17,
                  ),
                  const SizedBox(
                    width: 7,
                  ),
                  Text(
                    'Pilihanmu',
                    style:
                        GoogleFonts.poppins(textStyle: TextStyle(fontSize: 14)),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.only(left: 10, right: 10, top: 15),
                child: Obx(() {
                  if (jam.jam.isEmpty) {
                    return Center(
                      child: Column(
                        children: const [
                          SizedBox(
                            height: 70,
                          ),
                          Icon(
                            Icons.notifications_active_sharp,
                            size: 30,
                          ),
                          Text('Silahkan Pilih Hari')
                        ],
                      ),
                    );
                  }
                  if (jam.isLoading.value) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    return GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            childAspectRatio:
                                MediaQuery.of(context).size.width /
                                    (MediaQuery.of(context).size.height / 4.2),
                            crossAxisCount: 4),
                        itemCount: jam.jam.length,
                        itemBuilder: (context, index) {
                          return jam.jam[index].satatus == 'ready'
                              ? InkWell(
                                  onTap: () {
                                    setState(() {
                                      if (selectedJam
                                          .contains(jam.jam[index].jam)) {
                                        selectedJam.remove(jam.jam[index].jam);
                                      } else {
                                        selectedJam.add(jam.jam[index].jam);
                                      }

                                      isTapped = !isTapped;
                                      print(selectedJam);
                                    });
                                  },
                                  child: selectedJam
                                          .contains(jam.jam[index].jam)
                                      ? Padding(
                                          padding: const EdgeInsets.only(
                                              left: 5, right: 5, bottom: 5),
                                          child: SizedBox(
                                            width: 50,
                                            child: Container(
                                              alignment: Alignment.center,
                                              padding: const EdgeInsets.only(
                                                  left: 5, right: 5),
                                              decoration: BoxDecoration(
                                                  color: primaryColorDark,
                                                  borderRadius:
                                                      BorderRadius.circular(7)),
                                              child: Text(
                                                jam.jam[index].jam!,
                                                style: const TextStyle(
                                                    color: Colors.white),
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                          ),
                                        )
                                      : Padding(
                                          padding: const EdgeInsets.only(
                                              left: 5, right: 5, bottom: 5),
                                          child: SizedBox(
                                            width: 50,
                                            child: Container(
                                              alignment: Alignment.center,
                                              padding: const EdgeInsets.only(
                                                  left: 5, right: 5),
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                      color: primaryColorDark,
                                                      width: 1),
                                                  borderRadius:
                                                      BorderRadius.circular(7)),
                                              child: Text(
                                                jam.jam[index].jam!,
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                          ),
                                        ))
                              : Padding(
                                  padding: const EdgeInsets.only(
                                      left: 5, right: 5, bottom: 5),
                                  child: SizedBox(
                                    width: 50,
                                    child: Container(
                                      alignment: Alignment.center,
                                      padding: const EdgeInsets.only(
                                          left: 5, right: 5),
                                      decoration: BoxDecoration(
                                          color: Colors.grey.shade300,
                                          borderRadius:
                                              BorderRadius.circular(7)),
                                      child: Text(
                                        jam.jam[index].jam!,
                                        style: const TextStyle(
                                            color: Colors.black38),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),
                                );
                        });
                  }
                }),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 15, right: 15),
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Total Harga',
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.w500),
                      ),
                    ),
                    selectedJam.isEmpty
                        ? Text(
                            'Rp.  ',
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                fontSize: 17,
                              ),
                            ),
                          )
                        : Text(
                            'Rp. ${harga * (selectedJam.length - 1)} ',
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                fontSize: 17,
                              ),
                            ),
                          )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
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
                      onPressed: () {
                        final total = selectedJam.length;

                        print(total.isOdd ? "ganjil" : "genap");

                        if (selectedJam.length < 2) {
                          print(' Kurang ajg');
                          Get.rawSnackbar(
                              message: "Silahkan Pilih Hari dan Jam");
                        } else {
                          print('pas suh');
                          print(rekening);
                          print(' ${selectedJam.first} - ${selectedJam.last}');
                          Get.toNamed(ringkasanRoute, arguments: [
                            foto,
                            nama,
                            alamat,
                            notelp,
                            selectedJam.first,
                            selectedJam.last,
                            harga,
                            selectedJam,
                            rekening,
                            idLap,
                            valueHari
                          ]);
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
