import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
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
        child: ListView.builder(
            itemCount: 2,
            itemBuilder: (context, index) {
              return Container();
            }),
      ),
    );
  }
}
