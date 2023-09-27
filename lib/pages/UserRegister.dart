

import 'package:flutter/material.dart';
import 'package:flutter_bi_banker/customWidget/CommonFunction.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../customWidget/common_text_form_field.dart';
import '../customWidget/rounded_button.dart';
import '../res/strings.dart';
import 'Login.dart';



class UserRegister extends StatefulWidget {
  const UserRegister({Key? key}) : super(key: key);

  @override
  State<UserRegister> createState() => _UserRegisterState();
}

class _UserRegisterState extends State<UserRegister>{
  TextEditingController userController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {

    // TODO: implement build
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
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
          child: Form(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CommonTextFormField(
                    obscureText: false,
                    keyboardType: TextInputType.text,
                    hintText: Strings.employee_id,
                    prefixIcon: "assets/images/users.png",
                    controller: userController),
                const SizedBox(
                  height: 20.0,
                ),
                CommonTextFormField(
                    obscureText: true,
                    keyboardType: TextInputType.text,
                    hintText: Strings.password,
                    prefixIcon: "assets/images/mpin.png",
                    controller: passwordController),
                const SizedBox(
                  height: 40,
                ),
                SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: RoundedCornerButton(
                    text: Strings.submit,
                    onPressed: () {
                      if (isValidation()) {
                        /*Fluttertoast.showToast(
                            msg: "success", toastLength: Toast.LENGTH_SHORT);*/
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Login()),
                        );
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  bool isValidation() {
    if (userController.text == "") {
      CommonFunctions.settingModalBottomSheet("Please enter User Id", context);
      /*Fluttertoast.showToast(
          msg: "Please enter User Id", toastLength: Toast.LENGTH_SHORT);*/
      return false;
    }
    if (passwordController.text == "") {
      CommonFunctions.settingModalBottomSheet("Please enter password", context);
     /* Fluttertoast.showToast(
          msg: "Please enter password", toastLength: Toast.LENGTH_SHORT);*/
      return false;
    }
    return true;
  }

}


