import 'package:get/get.dart';
import 'package:user_futsal/src/api/repository.dart';
import 'package:user_futsal/src/model/pertandinganmodel/PertandinganModel.dart';

class PertandinganController extends GetxController {
  var isLoading = true.obs;
  var per = <Pertandingan>[].obs;

  void getFasilitas(int id) async {
    try {
      isLoading(true);
      var res = await ApiService().getPertandingan(id);
      if (res != null) {
        per.value = res;
      }
    } finally {
      isLoading(false);
    }
  }
}
