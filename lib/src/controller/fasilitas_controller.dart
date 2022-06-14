import 'package:get/get.dart';
import 'package:user_futsal/src/api/repository.dart';
import 'package:user_futsal/src/model/fasilitasmodel/FasilitasModel.dart';

class FasilitasController extends GetxController {
  var isLoading = true.obs;
  var fas = <Fasilitas>[].obs;

  void getFasilitas(int id) async {
    try {
      isLoading(true);
      var res = await ApiService().getFasilitas(id);
      if (res != null) {
        fas.value = res;
      }
    } finally {
      isLoading(false);
    }
  }
}
