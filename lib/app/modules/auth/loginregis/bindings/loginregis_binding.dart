import 'package:get/get.dart';

import '../controllers/loginregis_controller.dart';

class LoginregisBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginregisController>(
      () => LoginregisController(),
    );
  }
}
