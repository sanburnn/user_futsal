import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:user_futsal/src/page/login/login.dart';
import 'package:user_futsal/src/page/main/root.dart';
import 'package:user_futsal/src/page/main_page.dart';
import 'constant.dart';

final List<GetPage<dynamic>>? routes = [
  GetPage(name: rootRoute, page: () => Root()),
  GetPage(name: loginRoute, page: () => LoginPage()),
  GetPage(name: mainNavigationRoute, page: () => const MainPage())
];
