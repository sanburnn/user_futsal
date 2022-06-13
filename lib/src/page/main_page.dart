import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:user_futsal/src/page/home/index.dart';
import 'package:user_futsal/src/page/profile/index.dart';
import 'package:user_futsal/src/page/transaction/index.dart';
import 'package:user_futsal/src/services/themes.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;
  final PageStorageBucket bucket = PageStorageBucket();
  DateTime? currentBackPressTime;

  final List<Widget> _pages = <Widget>[
    FutsalHomePage(
      key: PageStorageKey<String>('pa-home'),
    ),
    TransactionPage(
      key: PageStorageKey<String>('pa-transaction'),
    ),
    ProfilePage(
      key: PageStorageKey<String>('pa-account'),
    ),
  ];
  Widget _bottomNavigationBar(int selectedIndex) => Theme(
        data: Theme.of(context).copyWith(canvasColor: primaryColor),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          selectedItemColor: primaryColorDark,
          unselectedIconTheme: IconThemeData(color: primaryColorDark),
          onTap: (int index) => setState(() => _selectedIndex = index),
          currentIndex: selectedIndex,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.home_sharp), label: 'Beranda'),
            BottomNavigationBarItem(
                icon: Icon(Icons.list_alt_outlined), label: 'Transaksi'),
            BottomNavigationBarItem(
                icon: Icon(Icons.account_circle), label: 'Akun'),
          ],
        ),
      );

  Future<bool> _onWillPop() {
    DateTime now = DateTime.now();
    if (currentBackPressTime == null ||
        now.difference(currentBackPressTime!) > Duration(seconds: 2)) {
      currentBackPressTime = now;
      Get.rawSnackbar(message: "Tekan sekali lagi untuk keluar");
      return Future.value(false);
    }
    return Future.value(true);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: _onWillPop,
        child: Scaffold(
          bottomNavigationBar: _bottomNavigationBar(_selectedIndex),
          body: PageStorage(
            child: _pages[_selectedIndex],
            bucket: bucket,
          ),
        ));
  }
}
