import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:user_futsal/src/controller/cekuser_controller.dart';
import 'package:user_futsal/src/controller/transaksi_controller.dart';
import 'package:user_futsal/src/services/themes.dart';

class TransactionPage extends StatefulWidget {
  TransactionPage({Key? key}) : super(key: key);

  @override
  State<TransactionPage> createState() => _TransactionPageState();
}

class _TransactionPageState extends State<TransactionPage> {
  TransaksiController transaksi = Get.put(TransaksiController());
  CekuserController cek = Get.put(CekuserController());
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    transaksi.getTransaksi(cek.cek.value.idPengguna!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: Center(
          child: Text('Transaksi',
              style: GoogleFonts.poppins(
                  color: Colors.black, fontWeight: FontWeight.w500)),
        ),
      ),
      body: Container(
        child: Obx(() {
          if (transaksi.isLoading.value) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return ListView.builder(
                itemCount: transaksi.trx.length,
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
                                transaksi.trx[index].idfutsal! == '1'
                                    ? 'Arena Glamour'
                                    : 'Green Futsal',
                                style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 17)),
                              )),
                          SizedBox(
                            height: 7,
                          ),
                          Container(
                            color: Colors.grey.shade400,
                            height: 1.5,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 15, right: 15),
                            child: Text(
                              'Silahkan meng upload bukti transfer DP jika sudah mentransfer.',
                              style: GoogleFonts.poppins(
                                  textStyle: TextStyle(fontSize: 14),
                                  color: Colors.grey.shade600),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                onTap: () {},
                                child: Container(
                                  padding: EdgeInsets.only(left: 5, right: 5),
                                  alignment: Alignment.center,
                                  decoration: const BoxDecoration(
                                      color: primaryColorDark,
                                      borderRadius: BorderRadius.only(
                                          bottomRight: Radius.circular(8),
                                          topRight: Radius.circular(8))),
                                  width: 130,
                                  height: 40,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Upload Bukti',
                                        style: GoogleFonts.poppins(
                                            textStyle:
                                                TextStyle(color: Colors.white)),
                                        textAlign: TextAlign.center,
                                      ),
                                      Icon(Icons.upload_file,
                                          size: 27, color: Colors.white)
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 10),
                                child: Text(
                                  transaksi.trx[index].satatus == 'cod'
                                      ? 'COD'
                                      : 'DP Rp.50.000',
                                  style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  )),
                                ),
                              )
                            ],
                          ),
                          Container(
                            alignment: Alignment.topRight,
                            child: Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: Text(
                                'Pending',
                                style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          )
                        ],
                      ),
                    ),
                  );
                });
          }
        }),
      ),
    );
  }
}
