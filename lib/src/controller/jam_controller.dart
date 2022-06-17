import 'package:get/get.dart';
import 'package:user_futsal/src/api/repository.dart';
import 'package:user_futsal/src/model/jammodel/JamModel.dart';

class JamController extends GetxController {
  var isLoading = true.obs;
  var jam = <Jam>[].obs;

  void getJam(String idfutsal, String idhari) async {
    try {
      isLoading(true);
      var res = await ApiService().getJam(idfutsal, idhari);
      if (res != null) {
        jam.value = res;
      }
    } finally {
      isLoading(false);
    }
  }
}
