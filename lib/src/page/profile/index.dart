import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:user_futsal/src/prefs/prefrences.dart';
import 'package:user_futsal/src/router/constant.dart';
import 'package:user_futsal/src/services/themes.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: Center(
          child: Text(
            'Profile',
            style: GoogleFonts.poppins(
                textStyle: TextStyle(
                    fontWeight: FontWeight.w500, color: Colors.black)),
          ),
        ),
      ),
      body: Container(
        child: ListView(
          children: [
            Container(
              height: 100,
              color: primaryColorDark,
            ),
            SizedBox(
              height: 20,
            ),
            Stack(
              children: [],
            ),
            Center(
              child: Container(
                  width: 140,
                  height: 50,
                  child: InkWell(
                    onTap: () {
                      removeToken();
                      Get.offAndToNamed(loginRoute);
                    },
                    child: Card(
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                      child: Container(
                        margin: EdgeInsets.only(left: 5, right: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.logout_outlined,
                              size: 25,
                            ),
                            SizedBox(
                              width: 7,
                            ),
                            Text(
                              'keluar',
                              style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                      fontSize: 15, color: primaryColorDark)),
                            )
                          ],
                        ),
                      ),
                    ),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
