import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:user_futsal/src/services/themes.dart';

class TransactionPage extends StatefulWidget {
  TransactionPage({Key? key}) : super(key: key);

  @override
  State<TransactionPage> createState() => _TransactionPageState();
}

class _TransactionPageState extends State<TransactionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Center(
          child: Text('Transaksi',
              style: GoogleFonts.poppins(
                  color: Colors.black, fontWeight: FontWeight.w500)),
        ),
      ),
      body: Container(
        child: ListView.builder(
            itemCount: 3,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.only(left: 15, right: 15),
                child: Card(
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 5,
                      ),
                      Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: Text(
                            'Transaksi',
                            style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                    fontWeight: FontWeight.w500, fontSize: 17)),
                          )),
                      SizedBox(
                        height: 7,
                      ),
                      Container(
                        color: primaryGreyDark,
                        height: 2,
                      ),
                      SizedBox(
                        height: 100,
                      )
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }
}
