
import 'package:flutter/material.dart';
import 'package:google_auth/Screens/Login/login_screen.dart';
import 'package:google_auth/constants.dart';
import 'package:google_auth/signup.dart';

import '../../../components/round_button.dart';
import 'background.dart';

class Body extends StatelessWidget {
  const Body({super.key});


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Background(
        child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text("SCIENCIFY",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Hatton',
                  fontSize: 30,
                )),
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Image.asset('assets/images/scientist1.png', width: 150),
            Image.asset('assets/images/scientist2.png', width: 150),
          ]),
          RoundButton(
            text: "login",
            press: (){
              Navigator.pushNamed(
                context,
                'login'
              );
            },
            fontFamily: 'Roxborough',
            color: kPrimaryLightColor,
            textColor: kPrimaryColor,
          ),
          SizedBox(height: 20),
          RoundButton(
            text: "sign up",
            press: (){
              Navigator.pushNamed(
                context,
                'signup'
              );
            },
            fontFamily: 'Roxborough',
            color: Colors.white,
            textColor: kPrimaryColor,
          ),
          SizedBox(height: 20),
          
        ],
          ),
      ));
  }
}
