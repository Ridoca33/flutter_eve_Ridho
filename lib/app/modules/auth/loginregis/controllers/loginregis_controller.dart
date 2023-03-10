import 'package:auth_socmed/app/modules/auth/socmedauth/controllers/socmedauth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginregisController extends GetxController {
  //TODO: Implement LoginregisController

  final count = 0.obs;

  var emailUserTextController = TextEditingController();
  var passwordUserTextController = TextEditingController();

  final SocmedauthController _socmedauthController = Get.put(
    SocmedauthController(),
  );

  RxBool errorEmail = false.obs;
  RxBool errorPass = false.obs;
  RxBool showPass = false.obs;
  RxBool isRegister = true.obs;

  @override
  void onInit() {
    super.onInit();
    var data = Get.arguments;
    isRegister.value = data['isRegister'];
    print(data);
  }

  @override
  void onReady() {
    super.onReady();
    print('oke');
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;

  void signInGoogle() {
    _socmedauthController.signInWithGoogle();
  }

  void signInFacebook() {
    _socmedauthController.signInWithFb();
  }

  void validateEmail() {
    emailUserTextController.text.isEmpty ||
            !emailUserTextController.text.isEmail
        ? errorEmail.value = true
        : errorEmail.value = false;
  }

  void validatePassword() {
    passwordUserTextController.text.isEmpty
        ? errorPass.value = true
        : errorPass.value = false;
  }

  void signUpEmail() {
    if (emailUserTextController.text.isEmpty ||
        passwordUserTextController.text.isEmpty ||
        !emailUserTextController.text.isEmail) {
      validateEmail();
      validatePassword();
    } else {
      _socmedauthController.checkUserExists(emailUserTextController.text).then(
        (value) {
          if (value) {
            _socmedauthController
                .getUserDataFromFirestore(emailUserTextController.text);
          } else {
            if (isRegister.value) {
              _socmedauthController.saveDataToFirestore(
                'John Doe',
                emailUserTextController.text,
                emailUserTextController.text,
                'https://www.w3schools.com/w3images/avatar2.png',
              );
            } else {
              Get.snackbar('error', 'Account Didnt Exist');
            }
          }
        },
      );
    }
  }
}
