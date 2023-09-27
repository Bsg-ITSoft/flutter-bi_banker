
import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:pinput/pinput.dart';

import '../customWidget/rounded_button.dart';
import '../res/strings.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();


  PackageInfo _packageInfo = PackageInfo(
    appName: 'Unknown',
    packageName: 'Unknown',
    version: 'Unknown',
    buildNumber: 'Unknown',
    buildSignature: 'Unknown',
    installerStore: 'Unknown',
  );

  @override
  Widget build(BuildContext context) {

    final defaultPinTheme = PinTheme(
      width: 56,
      height: 40,
      textStyle: TextStyle(
          fontSize: 25,
          color: Color.fromRGBO(234, 239, 243, 1),
          fontWeight: FontWeight.bold),
      decoration: BoxDecoration(
        border: Border.all(color: const Color.fromRGBO(234, 239, 243, 1)),
        borderRadius: BorderRadius.circular(20),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: const Color.fromRGBO(234, 239, 243, 1)),
      // border: Border.all(color: const Color.fromRGBO(114, 178, 238, 1)),
      borderRadius: BorderRadius.circular(8),
    );


    // TODO: implement build
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/bank_logo.png',
              fit: BoxFit.contain,
              height: 40,
            ),
            SizedBox(
              width: 20,
            ),
            Container(
              padding: const EdgeInsets.all(8.0),
              child: const Text(
                Strings.bank_name,
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          ],
        ),
        backgroundColor: Colors.transparent,
      ),

      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/bg.png'),
              fit: BoxFit.fill),
        ),
        // margin: const EdgeInsets.only(left: 25, right: 25),
        alignment: Alignment.center,
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Center(
                child: Pinput(
                  length: 6,
                  defaultPinTheme: focusedPinTheme,
                  obscureText: true,
                  controller: passwordController,
                  showCursor: true,
                 // onCompleted: (pin) => login(pin),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 50,
                width: double.infinity,
                child: RoundedCornerButton(
                  text: 'Login',
                  onPressed: () {
                   /* if (isValidation()) {
                      *//*Fluttertoast.showToast(
                            msg: "success", toastLength: Toast.LENGTH_SHORT);*//*
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Login()),
                      );
                    }*/
                  },
                ),
              ),
              SizedBox(
                height: 20,
              ),
             /* SizedBox(
                width: double.infinity,
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ForgotPassword(
                          data: 'forgot',
                        ),
                      ),
                    );
                  },
                  style: TextButton.styleFrom(
                    splashFactory: NoSplash.splashFactory,
                    foregroundColor: Colors.white,

                  ),
                  child: const Text(
                    Strings.forgot_mpin,
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'Lato',
                    ),
                  ),
                ),
              ),*/
              const SizedBox(
                height: 32,
              ),
              SizedBox(
                height: 40,
                width: double.infinity,
                child: TextButton(
                  onPressed: () {
                    /*Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Register(
                              data: 'register',
                            )));*/
                  },
                  style: TextButton.styleFrom(
                      foregroundColor: Colors.white,
                      splashFactory: NoSplash.splashFactory),
                  child: const Text(
                    Strings.register_user,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Lato',
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 120,
              ),
              Center(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                      splashFactory: NoSplash.splashFactory,
                      foregroundColor: Colors.white,
                    ),
                    child: Text(
                      _packageInfo.version,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),

    );
  }

}