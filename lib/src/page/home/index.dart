import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:user_futsal/src/config/env.dart';
import 'package:user_futsal/src/controller/cekuser_controller.dart';
import 'package:user_futsal/src/controller/getlapangan_controller.dart';
import 'package:user_futsal/src/router/constant.dart';
import 'package:user_futsal/src/services/assets.dart';
import 'package:user_futsal/src/services/themes.dart';

class FutsalHomePage extends StatefulWidget {
  FutsalHomePage({Key? key}) : super(key: key);

  @override
  State<FutsalHomePage> createState() => _FutsalHomePageState();
}

class _FutsalHomePageState extends State<FutsalHomePage> {
  CekuserController cek = Get.put(CekuserController());
  LapanganController lap = Get.put(LapanganController());
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    lap.getLapangan();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        floatHeaderSlivers: true,
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverToBoxAdapter(
              child: Container(
                color: Colors.white,
                padding: EdgeInsets.only(left: 30, top: 50),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      logoFutsal,
                      height: 75,
                    ),
                  ],
                ),
              ),
            ),
            SliverAppBar(
              pinned: true,
              floating: true,
              expandedHeight: 50,
              centerTitle: true,
              elevation: 0,
              shadowColor: Colors.white,
              backgroundColor: Colors.white,
              foregroundColor: Colors.white,
              bottom: AppBar(
                toolbarHeight: 52,
                backgroundColor: Colors.white,
                elevation: 0,
                title: Container(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Obx(() {
                    if (cek.isLoading.value) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else {
                      return Text('Hello ${cek.cek.value.username}',
                          style: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: primaryColorDark,
                                  fontSize: 26)));
                    }
                  }),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(left: 40, right: 20, top: 10),
                child: Text('Pilih Lapangan',
                    style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                          fontSize: 17, fontWeight: FontWeight.w600),
                    )),
              ),
            )
          ];
        },
        body: Container(
          height: MediaQuery.of(context).size.height * 0.8,
          padding: const EdgeInsets.only(bottom: 0),
          child: Container(
              padding: EdgeInsets.all(10.0),
              child: Obx(() {
                if (lap.isLoading.value) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  return ListView.builder(
                      itemCount: lap.lap.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(left: 15, right: 15),
                          child: Card(
                            elevation: 10,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                InkWell(
                                  onTap: () {},
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        width: 195,
                                        height: 120,
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          child: Image.network(
                                            BASE_URL_IMAGE_LAP +
                                                "/${lap.lap[index].foto}",
                                            fit: BoxFit.fill,
                                            height: 120,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Center(
                                        child: SizedBox(
                                          width: 100,
                                          child: Text(
                                            lap.lap[index].deskripsi!,
                                            style: GoogleFonts.poppins(
                                                textStyle: const TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 13)),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Container(
                                  padding: EdgeInsets.only(left: 5),
                                  child: Text(
                                    lap.lap[index].namatempat!,
                                    overflow: TextOverflow.ellipsis,
                                    style: GoogleFonts.poppins(
                                        textStyle: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 17)),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.only(left: 5, right: 5),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      SizedBox(
                                        width: 240,
                                        child: Text(
                                          lap.lap[index].alamat!,
                                          style: GoogleFonts.poppins(
                                              textStyle: TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 13)),
                                        ),
                                      ),
                                      Container(
                                        height: 30,
                                        width: 100,
                                        child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            16)),
                                                primary: primaryColorDark,
                                                onPrimary: Colors.white),
                                            onPressed: () => Get.toNamed(
                                                    lapanganRoute,
                                                    arguments: [
                                                      lap.lap[index].idFutsal,
                                                      lap.lap[index].foto,
                                                      lap.lap[index].namatempat,
                                                      lap.lap[index].deskripsi,
                                                      lap.lap[index].alamat,
                                                      lap.lap[index].notelp,
                                                      lap.lap[index].harga,
                                                      lap.lap[index].rekening ??
                                                          ""
                                                    ]),
                                            child: Text(
                                              'Pilih',
                                              style: GoogleFonts.poppins(),
                                            )),
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                )
                              ],
                            ),
                          ),
                        );
                      });
                }
              })),
        ),
      ),
    );
  }
}
