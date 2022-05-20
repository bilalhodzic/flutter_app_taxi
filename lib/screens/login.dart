import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/utils/sizeConfig.dart';

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

  @override
  void initState() {
    emailController.text = 'admin@admin.com';
    pwdController.text = 'qweasd';
    super.initState();
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
  Form(child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    Text('Login',
    style:TextStyle(fontSize: b*24,
    fontWeight: FontWeight.w900, letterSpacing: 0.65)),
    sh(30),
    TextField(controller: emailController,),
    sh(20),
    TextField(controller: pwdController,),
    sh(20),
    InkWell(child: Text(
      'Forget Password?',
      style:TextStyle(fontWeight: FontWeight.w700,
      color: Colors.black,
      fontSize: b*14)))

  ],))
        ]),
      )),
    );
  }
}
