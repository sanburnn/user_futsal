import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:user_futsal/src/controller/pertandingan_controller.dart';
import 'package:user_futsal/src/services/themes.dart';

class PertandinganPage extends StatefulWidget {
  PertandinganPage({Key? key}) : super(key: key);

  @override
  State<PertandinganPage> createState() => PertandinganPageState();
}

class PertandinganPageState extends State<PertandinganPage> {
  PertandinganController tanding = Get.put(PertandinganController());
  var idLap = Get.arguments[0];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tanding.getPertandingan(idLap);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: primaryColorDark),
        backgroundColor: Colors.white,
        title: Text(
          'Jadwal Pertandingan',
          style: GoogleFonts.poppins(color: Colors.black),
        ),
      ),
      body: NestedScrollView(
        floatHeaderSlivers: true,
        headerSliverBuilder: (BuildContext context, bool innerBoxScrolled) {
          return <Widget>[
            SliverToBoxAdapter(
                child: Container(
              padding: EdgeInsets.only(left: 20, top: 20),
              child: Text(
                'Jadwal Pertandingan Pada\nLapangan',
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: primaryColorDark),
                ),
              ),
            ))
          ];
        },
        body: Container(
          child: Obx(() {
            if (tanding.isLoading.value) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return ListView.builder(
                  itemCount: tanding.per.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.only(left: 15, right: 15),
                      child: Card(
                        elevation: 10,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 15,
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: Text(
                                'Atas Nama ${tanding.per[index].nama}',
                                style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15,
                                )),
                              ),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: Text('Jam ${tanding.per[index].jam}',
                                  style: GoogleFonts.poppins(
                                      textStyle: TextStyle(fontSize: 15))),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: Text(
                                'Tanggal ${tanding.per[index].tanggal}',
                                style: GoogleFonts.poppins(
                                    textStyle: TextStyle(fontSize: 15)),
                              ),
                            ),
                            SizedBox(
                              height: 8,
                            )
                          ],
                        ),
                      ),
                    );
                  });
            }
          }),
        ),
      ),
    );
  }
}
