import 'package:get/get.dart';
import 'package:user_futsal/src/api/repository.dart';
import 'package:user_futsal/src/model/transaksimodel/TransaksiModel.dart';

class TransaksiController extends GetxController {
  var isLoading = true.obs;
  var trx = <Transaksi>[].obs;

  void getTransaksi(String id) async {
    try {
      isLoading(true);
      var res = await ApiService().getTransaksi(id);
      if (res != null) {
        trx.value = res;
      }
    } finally {
      isLoading(false);
    }
  }
}
