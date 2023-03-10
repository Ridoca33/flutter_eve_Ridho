import 'package:get/get.dart';

import '../controllers/socmedauth_controller.dart';

class SocmedauthBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SocmedauthController>(
      () => SocmedauthController(),
    );
  }
}
