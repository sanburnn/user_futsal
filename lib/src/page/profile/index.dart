import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:user_futsal/src/controller/cekuser_controller.dart';
import 'package:user_futsal/src/prefs/prefrences.dart';
import 'package:user_futsal/src/router/constant.dart';
import 'package:user_futsal/src/services/themes.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  CekuserController cek = Get.put(CekuserController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    cek.cekUser();
  }

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
        child: Stack(
          children: [
            Obx(() {
              if (cek.isLoading.value) {
                return Positioned(
                  top: 40,
                  left: 180,
                  child: CircularProgressIndicator(
                    color: primaryColorDark,
                  ),
                );
              } else {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  height: 100,
                  color: primaryColorDark,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10, top: 10),
                        child: Text(
                          cek.cek.value.nama!,
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text(
                          '+ ${cek.cek.value.notelp}',
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w300),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }
            }),
            Positioned(
              top: 80,
              left: 80,
              child: InkWell(
                onTap: () {},
                child: Container(
                  child: Center(
                      child: Text(
                    'COMING SOON!',
                    style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          color: primaryColorDark),
                    ),
                  )),
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          blurRadius: 3.0,
                          spreadRadius: 0.5,
                          offset: Offset(
                              2.0, 2.0), // shadow direction: bottom right
                        )
                      ],
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(13)),
                  width: 250,
                  height: 60,
                  padding: EdgeInsets.only(left: 10, right: 10),
                ),
              ),
            ),
            SizedBox(
              height: 20,
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
                            const Icon(
                              Icons.logout_outlined,
                              size: 25,
                            ),
                            const SizedBox(
                              width: 7,
                            ),
                            Text(
                              'keluar',
                              style: GoogleFonts.poppins(
                                  textStyle: const TextStyle(
                                      fontSize: 15, color: primaryColorDark)),
                            )
                          ],
                        ),
                      ),
                    ),
                  )),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 160),
                child: Text(
                  'Version 1.0.0',
                  style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          color: primaryColorDark)),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
