import 'package:flutter/material.dart';
import 'package:google_auth/components/round_button.dart';
import 'package:google_auth/constants.dart';

import '../../components/already_have_an_account.dart';
import '../../components/rounded_input_field.dart';
import '../../components/rounded_password_field.dart';
import '../../components/text_field_container.dart';
import '../Welcome/components/background.dart';
import 'package:google_auth/services/functions/authFunctions.dart';
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  String email = '';
  String password = '';
  String fullname = '';
  bool login = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Background(
            child: Center(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("LOGIN",
                    style: TextStyle(
                      color: Colors.grey[850],
                      fontFamily: 'Roxborough',
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    )),
                Image.asset('assets/images/loginImage.png', width: 300),
                login
                  ? Container()
                  : TextFieldContainer(
                    child: TextFormField(
                        key: ValueKey('fullname'),
                        decoration: InputDecoration(
                      icon: Icon(
                        Icons.person,
                        color: kPrimaryColor,
                      ),
                    hintText: "Your Name",
                    border: InputBorder.none,
                  ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please Enter Full Name';
                          } else {
                            return null;
                          }
                        },
                        onSaved: (value) {
                          setState(() {
                            fullname = value!;
                          });
                        },
                      ),
                  ),
                TextFieldContainer(
                  child: TextFormField(
                    key: ValueKey('email'),
                    decoration: InputDecoration(
                      icon: Icon(
                        Icons.person,
                        color: kPrimaryColor,
                      ),
                    hintText: "Your Email",
                    border: InputBorder.none,
                  ),
                  onSaved: (value) {
                    setState(() {
                      email = value!;
                    });
                  },
                  validator: (value) {
                    if (value!.isEmpty || !value.contains('@')) {
                      return 'Please Enter valid Email';
                    } else {
                      return null;
                    }
                  },
                )),
                TextFieldContainer(
                  child: TextFormField(
                    key: ValueKey('password'),
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: "Password",
                    icon: Icon(
                      Icons.lock,
                    color: kPrimaryColor,
                    ),
                    suffixIcon: Icon(
                      Icons.visibility,
                      color: kPrimaryColor,
                    ),
                    border: InputBorder.none,
                  ),
                  validator: (value) {
                    if (value!.length < 6) {
                      return 'Please Enter Password of min length 6';
                    } else {
                      return null;
                    }
                  },
                  onSaved: (value) {
                    setState(() {
                      password = value!;
                    });
                  },
                )
              ),
                SizedBox(height: 10),
                RoundButton(
                  text: login ? 'Login' : 'Signup',
                  press: () async {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                          login
                              ? AuthServices.signinUser(email, password, context)
                              : AuthServices.signupUser(
                                  email, password, fullname, context);
                        }
                      },
                  color: kPrimaryColor,
                  textColor: kPrimaryLightColor,
                  fontFamily: "Roxborough",
                ),
                SizedBox(height: 10),
                AlreadyHaveAnAccountCheck(
                  press: () {
                    Navigator.pushNamed(context, 'signup');
                  },
                ),
              ],
            ),
          ),
        )),
      ),
    );
  }
}
