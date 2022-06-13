import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:user_futsal/src/services/themes.dart';

class FutsalHomePage extends StatefulWidget {
  FutsalHomePage({Key? key}) : super(key: key);

  @override
  State<FutsalHomePage> createState() => _FutsalHomePageState();
}

class _FutsalHomePageState extends State<FutsalHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        floatHeaderSlivers: true,
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverToBoxAdapter(
              child: Container(
                padding: EdgeInsets.only(left: 30, top: 50),
                child: Text('Hello',
                    style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: primaryColorDark,
                            fontSize: 30))),
              ),
            )
          ];
        },
        body: Container(),
      ),
    );
  }
}
