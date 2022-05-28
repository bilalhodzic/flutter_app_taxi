import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/providers/auth_provider.dart';
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
    await authProvider.login(dataToSend);
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    var h = SizeConfig.screenHeight / 812;
    var b = SizeConfig.screenWidth / 375;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: b * 30, vertical: h * 16),
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
                  InkWell(
                      child: Text('Forget Password?',
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
                ],
              ))
        ]),
      )),
    );
  }
}
