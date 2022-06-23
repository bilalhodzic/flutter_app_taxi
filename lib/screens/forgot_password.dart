import 'package:flutter/material.dart';
import 'package:flutter_app/services/auth_services.dart';
import 'package:flutter_app/utils/sizeConfig.dart';
import 'package:flutter_app/widgets/app_snackBar.dart';
import 'package:flutter_app/widgets/custom_button.dart';
import 'package:flutter_app/widgets/custom_text_field.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  TextEditingController emailController = TextEditingController();
  bool isPressed = false;
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  resetPass() async {
    FocusScope.of(context).unfocus();
    if (_formKey.currentState!.validate()) {
      setState(() {
        isPressed = true;
      });
      final dataToSend = {'email': emailController.text, 'isMobile': true};

      await AuthServices.forgotPassword(dataToSend);

      appSnackBar(
        context: context,
        msg: 'Link za ponistavanje sifre je poslan na vas mail',
        isError: false,
      );
      Navigator.of(context).pop();
    }
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
          padding: EdgeInsets.symmetric(horizontal: b * 28, vertical: h * 30),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  highlightColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Container(
                    padding: EdgeInsets.only(left: b * 7),
                    width: b * 30,
                    height: b * 30,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xffc4c4c4).withOpacity(0.4),
                    ),
                    child: Icon(
                      Icons.arrow_back_ios,
                      size: b * 16,
                    ),
                  ),
                ),
                sh(15),
                Center(
                  child: Image.asset(
                    'assets/images/forgot_illus_2.png',
                    height: h * 151,
                    width: b * 252,
                  ),
                ),
                sh(50),
                Text(
                  'Resetuj sifru',
                  style: TextStyle(
                    fontSize: b * 24,
                    fontWeight: FontWeight.w900,
                    letterSpacing: 0.5,
                  ),
                ),
                sh(30),
                CustomTextField(
                  label: 'Upisite vas email sa kojim ste se registrovali',
                  controller: emailController,
                  suffix: null,
                  isVisibilty: null,
                  validator: (value) {
                    Pattern emailPattern =
                        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                    RegExp regex = new RegExp(emailPattern.toString());
                    if (value!.isEmpty) {
                      return 'Polje ne smije biti prazno';
                    } else if ((!regex.hasMatch(value.trim()))) {
                      return 'Email nije validan';
                    } else
                      return null;
                  },
                ),
                sh(20),
                Center(
                  child: isPressed
                      ? LoadingButton()
                      : CustomButton(
                          label: 'Posalji',
                          onPressed: resetPass,
                        ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
