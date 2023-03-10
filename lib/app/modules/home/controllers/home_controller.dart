import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController

  RxBool isSigned = false.obs;
  RxString urlImage =
      'https://media.giphy.com/media/ycfHiJV6WZnQDFjSWH/giphy.gif'.obs;

  @override
  void onInit() {
    super.onInit();
    checkSigninUser();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void checkSigninUser() async {
    // check session and assign to variable is signed
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    if (sharedPreferences.getString('name') != null) {
      Get.offAllNamed(
        '/profile',
        arguments: {
          "name": sharedPreferences.getString('name'),
          "email": sharedPreferences.getString('email'),
          "uid": sharedPreferences.getString('uid'),
          "image_url": sharedPreferences.getString('image_url'),
        },
      );
    } else {
      Future.delayed(const Duration(seconds: 5), () {
        Get.offAllNamed('socmedauth');
      });
    }
  }
}
