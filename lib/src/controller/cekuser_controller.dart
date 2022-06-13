import 'package:get/get.dart';
import 'package:user_futsal/src/api/repository.dart';
import 'package:user_futsal/src/model/checkusermodel/CheckUserModel.dart';

class CekuserController extends GetxController {
  var isLoading = true.obs;
  var cek = UserModel().obs;
  @override
  void onInit() {
    cekUser();
    super.onInit();
  }

  void cekUser() async {
    try {
      isLoading(true);
      var res = await ApiService().cekUser();
      if (res != null) {
        cek.value = res;
      }
    } finally {
      isLoading(false);
    }
  }
}
