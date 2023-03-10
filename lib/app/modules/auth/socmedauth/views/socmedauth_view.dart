import 'package:auth_socmed/app/data/size.dart';
import 'package:auth_socmed/app/modules/auth/socmedauth/widget/socmed_login_btn.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/socmedauth_controller.dart';

class SocmedauthView extends GetView<SocmedauthController> {
  const SocmedauthView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Image.network(
                'https://img.freepik.com/free-vector/mobile-login-concept-illustration_114360-83.jpg?w=2000',
                height: 150,
              ),
            ),
            Container(
              margin:
                  EdgeInsets.symmetric(vertical: parameterGLobal.defaultMargin),
              child: Text(
                "Silahkan Masuk",
                style: TextStyle(
                  fontSize: parameterGLobal.sizeFontHeaderCard,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SocmedOptionButtonLogin(
              iconPath:
                  'https://w7.pngwing.com/pngs/561/460/png-transparent-fb-facebook-facebook-logo-social-media-icon.png',
              labelTxt: 'Sign in with Facebook',
              ontapButton: () => controller.signInWithFb(),
            ),
            SocmedOptionButtonLogin(
              iconPath: 'https://img.icons8.com/color/512/google-logo.png',
              labelTxt: 'Sign in with Google',
              ontapButton: () => controller.signInWithGoogle(),
            ),
            Container(
              margin:
                  EdgeInsets.symmetric(vertical: parameterGLobal.defaultMargin),
              child: Text(
                "OR",
                style: TextStyle(
                  fontSize: parameterGLobal.sizeFontMedium,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              height: 50,
              width: Get.size.width,
              margin: EdgeInsets.symmetric(
                horizontal: parameterGLobal.defaultMargin,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(
                    parameterGLobal.defaultBorder,
                  ),
                ),
              ),
              child: ElevatedButton(
                onPressed: () {
                  Get.toNamed(
                    '/loginregis',
                    arguments: {"isRegister": false},
                  );
                },
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        parameterGLobal.defaultBorder * 2,
                      ),
                    ),
                  ),
                  backgroundColor: MaterialStateProperty.all<Color>(
                    Colors.green,
                  ),
                ),
                child: const Text("Sign In With Password"),
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                top: parameterGLobal.defaultMargin,
              ),
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "Don't have an account? ",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: parameterGLobal.sizeFontSmall,
                      ),
                    ),
                    TextSpan(
                      text: 'Sign up',
                      style: TextStyle(
                        color: Colors.green,
                        fontSize: parameterGLobal.sizeFontSmall,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Get.toNamed(
                            '/loginregis',
                            arguments: {"isRegister": true},
                          );
                        },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
