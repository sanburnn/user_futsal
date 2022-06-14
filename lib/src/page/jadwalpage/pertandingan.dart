import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:user_futsal/src/services/themes.dart';

class PertandinganPage extends StatefulWidget {
  PertandinganPage({Key? key}) : super(key: key);

  @override
  State<PertandinganPage> createState() => PertandinganPageState();
}

class PertandinganPageState extends State<PertandinganPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: primaryColorDark),
        title: Text(
          'Jadwal Pertandingan',
          style: GoogleFonts.poppins(),
        ),
      ),
      body: Container(),
    );
  }
}
