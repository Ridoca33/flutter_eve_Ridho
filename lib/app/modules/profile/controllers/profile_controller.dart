import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileController extends GetxController {
  //TODO: Implement ProfileController

  final namaUser = ''.obs;
  final emailUser = ''.obs;
  final photoUser = ''.obs;

  @override
  void onInit() {
    super.onInit();
    var data = Get.arguments;
    namaUser.value = data['name'];
    emailUser.value = data['email'];
    photoUser.value = data['image_url'];
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void clearSession() async {
    Get.dialog(
      const Center(
        child: SizedBox(
          height: 20,
          width: 20,
          child: CircularProgressIndicator(),
        ),
      ),
    );
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    sharedPreferences.clear();
    Get.offAllNamed('/socmedauth');
  }

  void signOut() async {
    clearSession();
  }
}
