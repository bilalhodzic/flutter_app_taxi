import 'package:flutter/material.dart';
import 'package:flutter_app/utils/colors.dart';
import 'package:flutter_app/utils/sizeConfig.dart';
import 'package:provider/provider.dart';

class ModeSelectorScreen extends StatefulWidget {
  const ModeSelectorScreen({Key? key}) : super(key: key);

  @override
  State<ModeSelectorScreen> createState() => _ModeSelectorScreenState();
}

class _ModeSelectorScreenState extends State<ModeSelectorScreen> {
  late double h, b;
  bool isSelf = false;
  bool isTaxi = false;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    h = MediaQuery.of(context).size.height / 812;
    b = MediaQuery.of(context).size.width / 375;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          alignment: Alignment.center,
          child: Column(
            children: [
              sh(80),
              ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    'assets/logo/logo.png',
                    width: b * 155,
                    fit: BoxFit.contain,
                  )),
              sh(60),
              Text(
                'Izaberi opciju',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: b * 24,
                ),
              ),
              sh(16),
              Text(
                'Koju opciju zelite izabrati?',
                style: TextStyle(
                  fontSize: b * 12,
                ),
              ),
              sh(31),
              InkWell(
                highlightColor: Colors.transparent,
                splashColor: Colors.transparent,
                onTap: () {
                  setState(() {
                    isSelf = true;
                    isTaxi = false;
                  });

                  Future.delayed(Duration(milliseconds: 20), () {
                    // Navigator.of(context).push(
                    //   MaterialPageRoute(
                    //     builder: (_) => HomeMain(),
                    //   ),
                    // );
                  });
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: isSelf ? primaryColor : Color(0xfff9f9f9),
                    borderRadius: BorderRadius.circular(b * 4),
                  ),
                  height: h * 122,
                  width: b * 140,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/icons/self_drive.png',
                        width: b * 61,
                        height: h * 61,
                      ),
                      sh(12),
                      Text(
                        'Self drive vozilo',
                        style: TextStyle(
                          fontSize: b * 18,
                          fontWeight: FontWeight.w500,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              sh(20),
              InkWell(
                highlightColor: Colors.transparent,
                splashColor: Colors.transparent,
                onTap: () {
                  setState(() {
                    isSelf = false;
                    isTaxi = true;
                  });

                  Future.delayed(Duration(milliseconds: 20), () {
                    // Navigator.of(context).push(
                    //   MaterialPageRoute(
                    //     builder: (_) => MultiProvider(
                    //       providers: [
                    //         ChangeNotifierProvider(
                    //             create: (_) => TaxiBookingProvider()),
                    //         ChangeNotifierProvider(
                    //             create: (_) => AppFlowProvider())
                    //       ],
                    //       child: HomeMainTaxi(),
                    //     ),
                    //   ),
                    // );
                  });
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: isTaxi ? primaryColor : Color(0xfff9f9f9),
                    borderRadius: BorderRadius.circular(b * 4),
                  ),
                  height: h * 122,
                  width: b * 140,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/icons/taxi.png',
                        width: b * 61,
                        height: h * 61,
                      ),
                      sh(12),
                      Text(
                        "Taxi",
                        style: TextStyle(
                          fontSize: b * 18,
                          fontWeight: FontWeight.w500,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
