import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:user_futsal/src/controller/cekuser_controller.dart';
import 'package:user_futsal/src/controller/transaksi_controller.dart';
import 'package:user_futsal/src/router/constant.dart';
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
    super.initState();
    transaksi.getTransaksi(
        cek.cek.value.idPengguna!.isNotEmpty ? cek.cek.value.idPengguna! : "");
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
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return ListView.builder(
                itemCount: transaksi.trx.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 15, right: 15),
                    child: Card(
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 5,
                          ),
                          Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Text(
                                transaksi.trx[index].idfutsal! == '1'
                                    ? 'Arena Glamour'
                                    : 'Green Futsal',
                                style: GoogleFonts.poppins(
                                    textStyle: const TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 17)),
                              )),
                          const SizedBox(
                            height: 7,
                          ),
                          Container(
                            color: Colors.grey.shade400,
                            height: 1.5,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 15, right: 15),
                            child: Text(
                              transaksi.trx[index].tanggal!,
                              style: GoogleFonts.poppins(
                                  textStyle: TextStyle(fontSize: 16),
                                  color: Colors.black),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 15, right: 15),
                            child: Text(
                              transaksi.trx[index].jam!,
                              style: GoogleFonts.poppins(
                                  textStyle: TextStyle(fontSize: 16),
                                  color: Colors.black),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 15, right: 15),
                            child: Text(
                              transaksi.trx[index].satatus == 'trfpending'
                                  ? 'Silahkan meng upload bukti transfer DP jika sudah mentransfer.'
                                  : transaksi.trx[index].satatus == 'cod'
                                      ? 'Silahkan membayar DP/full kelokasi batas pembayaran adalah 1 jam setelah memesan'
                                      : transaksi.trx[index].satatus == 'cancel'
                                          ? 'Pesanan Batal\nPesanan Dibatalkan'
                                          : 'Pesanan Berhasil\nBerhasil Selesai',
                              style: GoogleFonts.poppins(
                                  textStyle: TextStyle(fontSize: 13),
                                  color: Colors.grey.shade600),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              transaksi.trx[index].satatus == 'trfpending'
                                  ? InkWell(
                                      onTap: () => Get.toNamed(buktiRoute,
                                          arguments: [
                                            transaksi.trx[index].bukti,
                                            transaksi.trx[index].idTransaksi
                                          ]),
                                      child: Container(
                                        padding: const EdgeInsets.only(
                                            left: 5, right: 5),
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
                                                  textStyle: const TextStyle(
                                                      color: Colors.white)),
                                              textAlign: TextAlign.center,
                                            ),
                                            const Icon(Icons.upload_file,
                                                size: 27, color: Colors.white)
                                          ],
                                        ),
                                      ),
                                    )
                                  : Container(),
                              Padding(
                                padding: const EdgeInsets.only(right: 10),
                                child: Text(
                                  transaksi.trx[index].satatus == 'cod'
                                      ? 'COD'
                                      : 'DP Rp.50.000',
                                  style: GoogleFonts.poppins(
                                      textStyle: const TextStyle(
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
                                transaksi.trx[index].satatus == 'cod'
                                    ? 'COD'
                                    : transaksi.trx[index].satatus ==
                                            'trfpending'
                                        ? 'Kirim Bukti Transfer'
                                        : transaksi.trx[index].satatus ==
                                                'succes'
                                            ? 'Berhasil'
                                            : transaksi.trx[index].satatus ==
                                                    'cancel'
                                                ? 'Dibatalkan'
                                                : '',
                                style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color: transaksi.trx[index].satatus ==
                                              'cod'
                                          ? Colors.blue
                                          : transaksi.trx[index].satatus ==
                                                  'succes'
                                              ? Colors.green
                                              : transaksi.trx[index].satatus ==
                                                      'cancel'
                                                  ? Colors.red
                                                  : transaksi.trx[index]
                                                              .satatus ==
                                                          'trfpending'
                                                      ? Colors.blue
                                                      : Colors.grey,
                                      fontSize: 16),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                height: 15,
                                width: 15,
                                color: Colors.blue,
                              ),
                              const Text(' : Proses'),
                              const SizedBox(
                                width: 5,
                              ),
                              Container(
                                height: 15,
                                width: 15,
                                color: Colors.green,
                              ),
                              const Text(' : Sukses'),
                              const SizedBox(
                                width: 5,
                              ),
                              Container(
                                height: 15,
                                width: 15,
                                color: Colors.red,
                              ),
                              const Text(' : Batal'),
                              const SizedBox(
                                width: 5,
                              ),
                            ],
                          ),
                          const SizedBox(
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
//!=========Status========>
//* cod = COD
//* trfpending = kirim bukti transfer
//* succes = SUKSES
