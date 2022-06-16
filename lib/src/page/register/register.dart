import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:user_futsal/src/router/constant.dart';
import 'package:user_futsal/src/services/themes.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool validate = false;
  bool inHiddenPass = true;
  bool _isHidden = true;
  TextEditingController nama = TextEditingController();
  TextEditingController notelp = TextEditingController();
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(left: 20, right: 20),
        child: ListView(
          children: [
            SizedBox(
              height: 30,
            ),
            Container(
              child: Text(
                'Daftar Akun Sewa Lapangan',
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 25,
                      color: primaryColorDark),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              child: Text(
                'Silahkan melengkapi form dibawah ini',
                style: GoogleFonts.poppins(
                  textStyle:
                      TextStyle(fontSize: 15, color: Colors.grey.shade600),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Theme(
              data: Theme.of(context).copyWith(
                  colorScheme: ThemeData()
                      .colorScheme
                      .copyWith(primary: primaryColorDark)),
              child: TextFormField(
                controller: nama,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: primaryColor,
                  hintText: "Nama",
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  errorText: validate ? 'Nama Tidak boleh kosong' : null,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Theme(
              data: Theme.of(context).copyWith(
                  colorScheme: ThemeData()
                      .colorScheme
                      .copyWith(primary: primaryColorDark)),
              child: TextFormField(
                controller: notelp,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: primaryColor,
                  hintText: "notelp",
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  errorText: validate ? 'notelp Tidak boleh kosong' : null,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Theme(
              data: Theme.of(context).copyWith(
                  colorScheme: ThemeData()
                      .colorScheme
                      .copyWith(primary: primaryColorDark)),
              child: TextFormField(
                controller: username,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: primaryColor,
                  hintText: "Username",
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  errorText: validate ? 'Username Tidak boleh kosong' : null,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Theme(
              data: Theme.of(context).copyWith(
                  colorScheme: ThemeData()
                      .colorScheme
                      .copyWith(primary: primaryColorDark)),
              child: TextFormField(
                controller: password,
                obscureText: _isHidden,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: primaryColor,
                  hintText: "Password",
                  suffixIcon: InkWell(
                    onTap: togglebutton,
                    child: Icon(
                      _isHidden ? Icons.visibility_off : Icons.visibility,
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  errorText: validate ? 'Password Tidak boleh kosong' : null,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 50,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(22)),
                    primary: primaryColorDark,
                    onPrimary: Colors.white, // foreground
                  ),
                  onPressed: () async {},
                  child: Text('Daftar',
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.bold,
                        ),
                      ))),
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Sudah punya akun?',
                    style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            fontSize: 16, color: Colors.grey.shade700))),
                SizedBox(
                  width: 5,
                ),
                InkWell(
                  onTap: () => Get.toNamed(loginRoute),
                  child: Text('LOGIN',
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                              color: primaryColorDark))),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void togglebutton() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }
}
