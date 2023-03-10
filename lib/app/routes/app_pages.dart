import 'package:get/get.dart';

import '../modules/auth/loginregis/bindings/loginregis_binding.dart';
import '../modules/auth/loginregis/views/loginregis_view.dart';
import '../modules/auth/socmedauth/bindings/socmedauth_binding.dart';
import '../modules/auth/socmedauth/views/socmedauth_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/profile/bindings/profile_binding.dart';
import '../modules/profile/views/profile_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;
  // static const INITIAL = Routes.SOCMEDAUTH;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SOCMEDAUTH,
      page: () => const SocmedauthView(),
      binding: SocmedauthBinding(),
    ),
    GetPage(
      name: _Paths.LOGINREGIS,
      page: () => const LoginregisView(),
      binding: LoginregisBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => const ProfileView(),
      binding: ProfileBinding(),
    ),
  ];
}
