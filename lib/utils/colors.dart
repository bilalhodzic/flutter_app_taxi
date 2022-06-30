import 'package:flutter/material.dart';
import 'package:flutter_app/utils/sizeConfig.dart';
import 'package:flutter_app/utils/strings.dart';

const Color secondaryColor = Color.fromARGB(255, 159, 143, 0);
const Color primaryColor = Color.fromARGB(255, 231, 198, 35);
const Color borderColor = Color(0xffe5e5e5);
const Color warningColor = Color.fromARGB(255, 202, 18, 18);

const Gradient buttonGradient = LinearGradient(
  colors: [primaryColor, primaryColor],
);

var boxShadow2 = [
  BoxShadow(
    color: Color(0xff555555).withOpacity(0.1),
    blurRadius: 9,
    offset: Offset(0, 0),
  )
];
var constBoxDecoration = BoxDecoration(
  color: Colors.white,
);
var allBoxDecoration = BoxDecoration(
  color: Colors.white,
  borderRadius: BorderRadius.circular(4),
  boxShadow: [
    BoxShadow(
      color: Color(0xff0000000).withOpacity(0.1),
      spreadRadius: 0,
      blurRadius: 4,
      offset: Offset(0, 4),
    ),
  ],
);

Map<int, Color> swatch = {
  50: primaryColor.withOpacity(0.1),
  100: primaryColor.withOpacity(0.2),
  200: primaryColor.withOpacity(0.3),
  300: primaryColor.withOpacity(0.4),
  400: primaryColor.withOpacity(0.5),
  500: primaryColor.withOpacity(0.6),
  600: primaryColor.withOpacity(0.7),
  700: primaryColor.withOpacity(0.8),
  800: primaryColor.withOpacity(0.9),
  900: primaryColor.withOpacity(1.0),
};
MaterialColor colorSwatch = MaterialColor(0xffDAE238, swatch);

DropdownMenuItem<int> hubItem(String name) {
  var h = SizeConfig.screenHeight / 812;
  var b = SizeConfig.screenWidth / 375;

  return DropdownMenuItem<int>(
    child: Container(
      height: h * 23,
      width: b * 120,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Color(0xff1a1a1a),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        name,
        style: TextStyle(
          color: Colors.white,
          fontSize: b * 12,
          letterSpacing: 0.6,
          fontStyle: FontStyle.italic,
        ),
      ),
    ),
    value: -2,
  );
}
