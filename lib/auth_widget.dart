import 'package:flutter/material.dart';
import 'package:flutter_app/screens/login.dart';
import 'package:flutter_app/utils/colors.dart';
import 'package:flutter_app/utils/sizeConfig.dart';

class AuthWidget extends StatefulWidget {
  AuthWidget({Key? key}) : super(key: key);

  @override
  _AuthWidgetState createState() => _AuthWidgetState();
}

class _AuthWidgetState extends State<AuthWidget> with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
      duration: const Duration(milliseconds: 1500), vsync: this);

  @override
  void initState() {
    checkState();
    super.initState();
  }

  checkState() async {
    _controller.animateTo(1, curve: Curves.easeInCirc);
    await Future.delayed(Duration(milliseconds: 1500));
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (_) => LoginScreen()));
  }

  @override
  Widget build(BuildContext context) {
    var height = SizeConfig.screenHeight / 812;
    var width = SizeConfig.screenWidth / 375;
    return Scaffold(
        body: Container(
            height: height * 812,
            width: width * 375,
            padding: EdgeInsets.symmetric(
                horizontal: width * 80, vertical: height * 80),
            decoration: BoxDecoration(gradient: buttonGradient),
            child: ScaleTransition(
              scale: _controller,
              alignment: Alignment.center,
              child: Container(
                  padding: EdgeInsets.symmetric(horizontal: width * 30),
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30)),
                  child: Image.asset('assets/logo/logo.png')),
            )));
  }
}
