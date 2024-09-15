import 'package:get/get.dart';

class CreateNewPasswordController extends GetxController {
  // Observables to handle the visibility of password fields
  RxBool isPasswordVisible = false.obs;
  RxBool isConfirmPasswordVisible = false.obs;
  RxBool isPasswordChanged = false.obs;

  // Function to toggle the password visibility
  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  // Function to toggle the confirm password visibility
  void toggleConfirmPasswordVisibility() {
    isConfirmPasswordVisible.value = !isConfirmPasswordVisible.value;
  }

  // Function to handle password confirmation logic
  void confirmPasswordChange() {
    isPasswordChanged.value = true;
  }
}
