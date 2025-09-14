import 'package:get/get.dart';
import 'package:registrationpage/Bindings/LoginBinding.dart';  
import 'AppRoute.dart';
import '../Bindings/RegistrationBinding.dart';
import '../View/Registration.dart';
import '../View/Login.dart';
class AppPage {
  static final List<GetPage> pages = [
    GetPage(
      name: Approute.register,
      page: () => const Registration(),
      binding: RegistrationBinding(),
    ),
    GetPage(
      name: Approute.Login,
      page: () => const Login(),
      binding:LoginBinding(),
    ),
  ];
}

