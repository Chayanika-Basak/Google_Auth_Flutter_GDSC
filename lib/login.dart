import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:google_auth/Screens/Welcome/welcome_screen.dart';
import 'package:google_auth/home.dart';
import 'package:google_auth/login_controller.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginPage extends StatelessWidget {
  final controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Login or SignUp"),
        ),
        body: Center(child: Obx(() {
          if (controller.googleAccount.value == null)
            return buildButton();
          else
            return WelcomeScreen();
        })));
  }

  FloatingActionButton buildButton() {
    return FloatingActionButton.extended(
        onPressed: () {
          controller.login();
        },
        label: Text("Signup with Google"),
        icon: Image.asset("assets/images/google.png", height: 32, width: 32));
  }
}
