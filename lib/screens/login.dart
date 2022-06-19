import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/providers/auth_provider.dart';
import 'package:flutter_app/providers/user_provider.dart';
import 'package:flutter_app/screens/mode_selector.dart';
import 'package:flutter_app/utils/colors.dart';
import 'package:flutter_app/utils/sizeConfig.dart';
import 'package:flutter_app/widgets/custom_button.dart';
import 'package:flutter_app/widgets/custom_text_field.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController pwdController = TextEditingController();
  bool isVisibilty = false;
  bool isPressed = false;

  bool isError = false;
  bool terms = false;

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    emailController.text = 'admin@admin.com';
    pwdController.text = 'qweasd';
    super.initState();
  }

  login() async {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    final dataToSend = {
      'userName': emailController.text,
      'password': pwdController.text
    };
    try {
      await authProvider.login(dataToSend);

      var userProvider = Provider.of<UserProvider>(context, listen: false);
      if (userProvider.user != null) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (_) => ModeSelectorScreen(),
          ),
        );
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    var h = SizeConfig.screenHeight / 812;
    var b = SizeConfig.screenWidth / 375;
    AuthProvider authProvider =
        Provider.of<AuthProvider>(context, listen: false);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: b * 30, vertical: h * 16),
        child: SingleChildScrollView(
          child: Column(children: [
            sh(30),
            Image.asset(
              'assets/images/login_illus.png',
              width: b * 178,
              height: h * 133,
            ),
            sh(30),
            Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Login',
                        style: TextStyle(
                            fontSize: b * 24,
                            fontWeight: FontWeight.w900,
                            letterSpacing: 0.65)),
                    sh(30),
                    CustomTextField(
                      controller: emailController,
                      label: 'Enter email',
                      validator: (value) {
                        Pattern emailPattern =
                            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                        RegExp regex = new RegExp(emailPattern.toString());
                        if (value!.isEmpty) {
                          setState(() {
                            isError = true;
                          });
                          return 'Field cannot be empty!';
                        } else if ((!regex.hasMatch(value.trim()))) {
                          setState(() {
                            isError = true;
                          });
                          return 'Email is not valid!';
                        } else
                          return null;
                      },
                    ),
                    sh(20),
                    CustomTextFieldPassword(
                      controller: pwdController,
                      onChanged: (value) {
                        authProvider.setError(null);
                      },
                      label: 'Enter password',
                      error: isError,
                      validator: (val) {
                        if (val!.trim() == "") {
                          setState(() {
                            isError = true;
                          });
                          return 'Field cannot be empty';
                        } else {
                          setState(() {
                            isError = false;
                          });
                          return null;
                        }
                      },
                    ),
                    sh(20),
                    Consumer<AuthProvider>(builder: (_, notifier, __) {
                      if (notifier.error != null)
                        return Column(
                          children: [
                            Text(
                              notifier.error!,
                              style: TextStyle(color: warningColor),
                            ),
                            sh(20)
                          ],
                        );

                      return SizedBox();
                    }),
                    InkWell(
                        child: Text('Zaboravljena Sifra?',
                            style: TextStyle(
                                fontWeight: FontWeight.w700,
                                color: Colors.black,
                                fontSize: b * 14))),
                    sh(20),
                    Center(
                        child: CustomButton(
                      label: 'Login',
                      onPressed: () async {
                        FocusScope.of(context).unfocus();
                        if (!_formKey.currentState!.validate()) return null;

                        isPressed = true;
                        setState(() {});
                        login();
                      },
                    )),
                    sh(18),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.only(right: b * 10),
                            height: 1,
                            color: Color(0xffe4e4e4),
                          ),
                        ),
                        Text(
                          'ili'.toUpperCase(),
                          style: TextStyle(
                            fontSize: b * 12,
                            color: Color(0xffe4e4e4),
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.only(left: b * 10),
                            height: 1,
                            color: Color(0xffe4e4e4),
                          ),
                        ),
                      ],
                    ),
                    sh(18),
                    MaterialButton(
                      onPressed: () {},
                      padding: EdgeInsets.symmetric(vertical: h * 15),
                      elevation: 0,
                      minWidth: double.infinity,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                      color: Color(0xff395185),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/icons/fb-icon.png',
                            height: h * 17,
                            width: b * 17,
                          ),
                          sb(18),
                          Text(
                            'Prijavi se uz Facebook',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontSize: b * 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                    sh(20),
                    MaterialButton(
                      onPressed: () {},
                      padding: EdgeInsets.symmetric(vertical: h * 15),
                      elevation: 0,
                      minWidth: double.infinity,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(color: borderColor),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      color: Colors.white,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/icons/google-icon.png',
                            height: h * 17,
                            width: b * 17,
                          ),
                          sb(18),
                          Text(
                            'Prijavi se sa Google',
                            style: TextStyle(
                              fontSize: b * 14,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ),
                    sh(20),
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      Text(
                        'Nemate kreiran racun? ',
                        style: TextStyle(
                          fontSize: b * 14,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          // Navigator.of(context).push(
                          //   MaterialPageRoute(
                          //     builder: (_) => RegisterScreen(),
                          //   ),
                          // );
                        },
                        child: Text(
                          'Napravi racun',
                          style: TextStyle(
                            fontSize: b * 14,
                            fontWeight: FontWeight.w700,
                            color: secondaryColor,
                          ),
                        ),
                      ),
                    ]),
                    sh(30),
                  ],
                ))
          ]),
        ),
      )),
    );
  }
}
