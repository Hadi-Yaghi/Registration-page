import 'package:get/get.dart';
import '../Controller/RegistrationController.dart';



class RegistrationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RegistrationController>(() => RegistrationController());
  }
}
