import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:user_futsal/src/controller/login_controller.dart';
import 'package:user_futsal/src/services/assets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:user_futsal/src/services/themes.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool validate = false;
  bool inHiddenPass = true;
  bool _isHidden = true;
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  LoginController loginCon = Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ListView(
          children: [
            SizedBox(
              height: 50,
            ),
            Image.asset(
              logoFutsal,
              height: 100,
              width: 100,
            ),
            SizedBox(
              height: 30,
            ),
            Center(
              child: Text(
                'Selamat Datang Di Aplikasi',
                style: GoogleFonts.poppins(
                    color: primaryColorDark,
                    fontWeight: FontWeight.bold,
                    fontSize: 21),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25, right: 25),
              child: Theme(
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
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    errorText: validate ? 'Username Tidak boleh kosong' : null,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 35,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25, right: 25),
              child: Theme(
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
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    errorText: validate ? 'Password Tidak boleh kosong' : null,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25, right: 25),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 50,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                      primary: primaryColorDark,
                      onPrimary: Colors.white, // foreground
                    ),
                    onPressed: () async {
                      if (username.text.isEmpty || password.text.isEmpty) {
                        setState(() {
                          validate = true;
                        });
                      } else {
                        await loginCon.loginUsers(username.text, password.text);
                        // otp.kirimOtp();
                        // validateAuth();
                      }
                    },
                    child: Obx(() {
                      return loginCon.isLoading.value == true
                          ? CircularProgressIndicator(
                              color: Colors.white,
                            )
                          : Text(
                              'Login',
                              style: TextStyle(
                                  fontSize: 19,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "Roboto"),
                            );
                    })),
              ),
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
