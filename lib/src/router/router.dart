import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:user_futsal/src/page/booking/booking.dart';
import 'package:user_futsal/src/page/cod/cod.dart';
import 'package:user_futsal/src/page/fasilitas/fasilitas.dart';
import 'package:user_futsal/src/page/futsal/lapanganfutsal.dart';
import 'package:user_futsal/src/page/jadwalpage/pertandingan.dart';
import 'package:user_futsal/src/page/login/login.dart';
import 'package:user_futsal/src/page/main/root.dart';
import 'package:user_futsal/src/page/main_page.dart';
import 'package:user_futsal/src/page/register/register.dart';
import 'package:user_futsal/src/page/ringkasanorder/rengkasan.dart';
import 'package:user_futsal/src/page/trfsukses/SuksesPage.dart';
import 'package:user_futsal/src/page/uploadbukti/upload.dart';
import 'constant.dart';

final List<GetPage<dynamic>>? routes = [
  GetPage(name: rootRoute, page: () => Root()),
  GetPage(name: loginRoute, page: () => LoginPage()),
  GetPage(name: mainNavigationRoute, page: () => const MainPage()),
  GetPage(name: lapanganRoute, page: () => LapanganFutsal()),
  GetPage(name: fasilitasRoute, page: () => FasilitasPage()),
  GetPage(name: pertandinganRoute, page: () => PertandinganPage()),
  GetPage(name: registerRoute, page: () => RegisterPage()),
  GetPage(name: bookingRoute, page: () => BookingPage()),
  GetPage(name: ringkasanRoute, page: () => RingkasanPage()),
  GetPage(name: codRoute, page: () => CodPage()),
  GetPage(name: suksesRoute, page: () => SuksesPage()),
  GetPage(name: buktiRoute, page: () => UploadBuktiPage())
];
