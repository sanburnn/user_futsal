import 'package:get/get.dart';
import 'package:user_futsal/src/api/repository.dart';
import 'package:user_futsal/src/model/checkusermodel/CheckUserModel.dart';
import 'package:user_futsal/src/model/futsalmodel/FutsalModel.dart';

class LapanganController extends GetxController {
  var isLoading = true.obs;
  var lap = <Futsal>[].obs;

  void getLapangan() async {
    try {
      isLoading(true);
      var res = await ApiService().getFutsal();
      if (res != null) {
        lap.value = res;
      }
    } finally {
      isLoading(false);
    }
  }
}
