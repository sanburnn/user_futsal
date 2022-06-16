import 'package:get/get.dart';
import 'package:user_futsal/src/api/repository.dart';
import 'package:user_futsal/src/model/checkusermodel/CheckUserModel.dart';
import 'package:user_futsal/src/model/futsalmodel/FutsalModel.dart';
import 'package:user_futsal/src/model/harimodel/HariModel.dart';

class HariController extends GetxController {
  var isLoading = true.obs;
  var hari = <Hari>[].obs;

  void getHari(int id) async {
    try {
      isLoading(true);
      var res = await ApiService().getHari(id);
      if (res != null) {
        hari.value = res;
      }
    } finally {
      isLoading(false);
    }
  }
}
