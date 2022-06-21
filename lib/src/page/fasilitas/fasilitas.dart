import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:user_futsal/src/config/env.dart';
import 'package:user_futsal/src/controller/fasilitas_controller.dart';
import 'package:user_futsal/src/services/themes.dart';

class FasilitasPage extends StatefulWidget {
  FasilitasPage({Key? key}) : super(key: key);

  @override
  State<FasilitasPage> createState() => _FasilitasPageState();
}

class _FasilitasPageState extends State<FasilitasPage> {
  var idlap = Get.arguments[0];
  FasilitasController fasilitas = Get.put(FasilitasController());
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fasilitas.getFasilitas(idlap);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: primaryColorDark),
        backgroundColor: Colors.white,
        title: Text(
          'Fasilitas Tempat',
          style: GoogleFonts.poppins(textStyle: TextStyle(color: Colors.black)),
        ),
      ),
      body: Container(
        child: Container(
          padding: const EdgeInsets.all(10),
          child: Obx(() {
            if (fasilitas.isLoading.value) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return ListView.builder(
                  itemCount: fasilitas.fas.length,
                  itemBuilder: (context, index) {
                    return Container(
                      child: Padding(
                        padding: EdgeInsets.only(left: 25, right: 25),
                        child: Card(
                          elevation: 10,
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 360,
                                height: 150,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.network(
                                    BASE_URL_IMAGE_FASIL +
                                        "/${fasilitas.fas[index].foto}",
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                padding: const EdgeInsets.only(left: 5),
                                child: Text(
                                  fasilitas.fas[index].nama!,
                                  style: GoogleFonts.poppins(
                                    textStyle: const TextStyle(
                                        color: primaryColorDark,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 17),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                color: primaryGreyDark,
                                height: 2,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                padding: EdgeInsets.only(left: 5),
                                child: SizedBox(
                                  width: 250,
                                  child: Text(
                                    fasilitas.fas[index].deskripsi!,
                                    style: GoogleFonts.poppins(
                                        textStyle: TextStyle(fontSize: 14)),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              )
                            ],
                          ),
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
