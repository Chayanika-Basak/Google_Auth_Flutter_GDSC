import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_auth/home.dart';
import 'package:google_auth/login_controller.dart';

// import 'Screens/Welcome/welcome_screen.dart';
import 'components/round_button.dart';
import 'constants.dart';

class SignUp extends StatelessWidget {
  final controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Obx(() {
        if (controller.googleAccount.value == null) {
          return FloatingActionButton.extended(
            label: Text("Sigin with Google"),
            onPressed: () {
              controller.login();
            },
          );
        } else {
          return const HomePage();
        }
      })),
    );
  }
}
