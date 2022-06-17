import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:user_futsal/src/controller/cekuser_controller.dart';
import 'package:user_futsal/src/controller/hari_controller.dart';
import 'package:user_futsal/src/services/themes.dart';

class BookingPage extends StatefulWidget {
  BookingPage({Key? key}) : super(key: key);

  @override
  State<BookingPage> createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  HariController hari = Get.put(HariController());
  CekuserController cek = Get.put(CekuserController());
  var idLap = Get.arguments[0];
  String? _selectHari;

  int? _radioValue = -1;
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
              padding: EdgeInsets.only(top: 20, left: 15),
              child: Text(
                'Jadwal',
                style: GoogleFonts.poppins(
                  textStyle:
                      TextStyle(fontWeight: FontWeight.w600, fontSize: 17),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 5, left: 15),
              child: Text(
                'Pilih hari untuk mengetahui jam',
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(fontSize: 15),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 20),
              height: 80,
              child: Obx(() {
                if (hari.isLoading.value) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  return ListView.builder(
                      physics: BouncingScrollPhysics(),
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
                                      textStyle: TextStyle(
                                          color: Colors.black38,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                ),
                              )
                            : InkWell(
                                onTap: () => setState(() {
                                  _selectHari = hari.hari[index].tanggal;
                                  _radioValue = index;
                                  print(_selectHari);
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
                                                textStyle: TextStyle(
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
                                                textStyle: TextStyle(
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
              padding: EdgeInsets.only(left: 15, right: 15, top: 15),
              child: Text(
                'Pilih Jam',
                style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                        fontWeight: FontWeight.w500, fontSize: 15)),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 15, right: 15, top: 10),
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.grey.shade400,
                        borderRadius: BorderRadius.circular(5)),
                    width: 17,
                    height: 17,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    'Tidak Tersedia',
                    style:
                        GoogleFonts.poppins(textStyle: TextStyle(fontSize: 14)),
                  ),
                  SizedBox(
                    width: 7,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: primaryColorDark,
                        borderRadius: BorderRadius.circular(5)),
                    width: 17,
                    height: 17,
                  ),
                  SizedBox(
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
                child: Obx((){
                  if(){}
                  return GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          childAspectRatio: MediaQuery.of(context).size.width /
                              (MediaQuery.of(context).size.height / 4.2),
                          crossAxisCount: 4),
                      itemCount: 8,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding:
                              const EdgeInsets.only(left: 5, right: 5, bottom: 5),
                          child: SizedBox(
                            width: 50,
                            child: Container(
                              alignment: Alignment.center,
                              padding: EdgeInsets.only(left: 5, right: 5),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: primaryColorDark, width: 1),
                                  borderRadius: BorderRadius.circular(7)),
                              child: Text(
                                '13.00',
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        );
                      });
               } ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
