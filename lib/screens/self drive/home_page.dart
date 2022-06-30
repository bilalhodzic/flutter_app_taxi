import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/models/current_loc_model.dart';
import 'package:flutter_app/models/vehicle_type_model.dart';
import 'package:flutter_app/providers/home_provider.dart';
import 'package:flutter_app/screens/self%20drive/bookCar.dart';
import 'package:flutter_app/services/home_service.dart';
import 'package:flutter_app/utils/colors.dart';
import 'package:flutter_app/utils/sizeConfig.dart';
import 'package:flutter_app/utils/strings.dart';
import 'package:flutter_app/utils/utilFunctions.dart';
import 'package:flutter_app/widgets/vehicle_card.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController searchController = TextEditingController();
  Future? getClasses;
  Future<void>? getAvailableVehicle;
  List<VehicleType> vehicleTypes = [];
  CurrentLoc currentLoc = CurrentLoc(
    pickCity: ' pick city',
    dropCity: 'drop city',
    pickCityAddr: 'pick address',
    dropCityAddr: ' drop addrss',
    dropCityID: '',
    pickCityID: '',
    dropTime: DateTime.now(),
    pickTime: DateTime(2021),
    //dropCoordinates: LatLng(0, 0),
    //pickCoordinates: LatLng(0, 0),
  );
  VehicleType allVehicleType =
      VehicleType(name: AllLabel, vehicleTypeId: -1, seats: 0, icon: "");

  int vehicleType = -1;
  bool isSearching = false;

  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();

    // await getUser();
    // await checkCity();
  }

  @override
  void initState() {
    super.initState();

    getClasses = HomeService.getVehicleTypes();

    // getClasses =
    //     Provider.of<HomeProvider>(context, listen: false).getVehicleClasses();

    // getAvailableVehicle =
    //     Provider.of<HomeProvider>(context, listen: false).getModelByDateCity();
  }

  // getUser() async {
  //   Future.delayed(Duration(seconds: 2));
  //   final user = await PreferencesUtils.getUser();
  //   Provider.of<AuthProvider>(context, listen: false).setUser(user);
  // }

  // checkCity() async {
  //   var checkForCity = await HomeProvider().checkForCity();
  //   if (!checkForCity)
  //     Navigator.of(context).pushAndRemoveUntil(
  //         MaterialPageRoute(
  //           builder: (context) => SelectCityScreen(),
  //         ),
  //         (route) => false);
  //   else {
  //     currentLoc = (await PreferencesUtils.getLoc())!;
  //     if (currentLoc.pickTime != DateTime(2021)) {
  //       if (currentLoc.pickTime!.compareTo(DateTime.now()) < 0) {
  //         await changeDateDialog(context);
  //         Navigator.of(context).pushAndRemoveUntil(
  //             MaterialPageRoute(
  //               builder: (context) => SelectCityScreen(),
  //             ),
  //             (route) => false);
  //       }
  //     }
  //   }
  // }

  DateTime startDate = DateTime.now().add(Duration(days: 1));
  DateTime endDate = DateTime.now().add(Duration(days: 11));

  late String startDateFormat = DateFormat('EEE, d MMMM, yy')
      .format(DateTime.now().add(Duration(days: 1)));
  late String endDateFormat = DateFormat('EEE, d MMMM, yy')
      .format(DateTime.now().add(Duration(days: 11)));

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    var h = SizeConfig.screenHeight / 812;
    var b = SizeConfig.screenWidth / 375;
    final provider = HomeProvider.instance;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: primaryColor,
      body: SafeArea(
        child: Column(children: [
          Container(
            decoration: BoxDecoration(
              gradient: buttonGradient,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  // onTap: () {
                  //   Navigator.of(context).push(
                  //     MaterialPageRoute(
                  //       builder: (_) => SelectCityScreen(),
                  //     ),
                  //   );
                  // },
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: h * 22,
                      horizontal: b * 20,
                    ),
                    child: Icon(
                      Icons.arrow_back_ios_new_rounded,
                      size: b * 18,
                    ),
                  ),
                ),
                Spacer(),
                Text(
                  ChooseYourCar,
                  style: TextStyle(
                    fontSize: b * 18,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Spacer(flex: 2),
              ],
            ),
          ),
          Expanded(
            child: Container(
              decoration: constBoxDecoration,
              child: Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      physics: BouncingScrollPhysics(),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          sh(10),
                          Container(
                            width: SizeConfig.screenWidth,
                            margin: EdgeInsets.symmetric(horizontal: b * 15),
                            padding: EdgeInsets.fromLTRB(
                                b * 17, h * 11, b * 27, h * 14),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(4),
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0xff0000000).withOpacity(0.1),
                                  blurRadius: 4,
                                  offset: Offset(0, 4),
                                ),
                              ],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    SvgPicture.asset(
                                      'assets/icons/blue_cirle.svg',
                                      width: b * 17,
                                    ),
                                    sb(19),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            currentLoc.pickCityAddr ?? "",
                                            style: TextStyle(
                                              letterSpacing: 0.45,
                                              fontSize: b * 11.7,
                                            ),
                                          ),
                                          sh(5),
                                          Row(
                                            children: [
                                              Text(
                                                "$StartDateLabel: " +
                                                    dateFormat(
                                                        currentLoc.pickTime!),
                                                style: TextStyle(
                                                  fontSize: b * 11.5,
                                                ),
                                              ),
                                              Spacer(),
                                              Text(
                                                "$StartTimeLabel: " +
                                                    timeFormatDate(
                                                        currentLoc.pickTime!),
                                                style: TextStyle(
                                                  fontSize: b * 11.5,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                Transform.translate(
                                  offset: Offset(-b * 3, 0),
                                  child: Icon(
                                    Icons.more_vert,
                                    color: Color(0xff999999),
                                  ),
                                ),
                                Row(
                                  children: [
                                    SvgPicture.asset(
                                      'assets/icons/choose_city.svg',
                                      color: secondaryColor,
                                      height: h * 20,
                                    ),
                                    sb(19),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            currentLoc.dropCityAddr ?? "",
                                            style: TextStyle(
                                              fontSize: b * 11.7,
                                              letterSpacing: 0.45,
                                            ),
                                          ),
                                          sh(5),
                                          Row(
                                            children: [
                                              Text(
                                                "$EndDateLabel: " +
                                                    dateFormat(
                                                        currentLoc.dropTime!),
                                                style: TextStyle(
                                                  fontSize: b * 11.5,
                                                ),
                                              ),
                                              Spacer(),
                                              Text(
                                                "$EndTimeLabel: " +
                                                    timeFormatDate(
                                                        currentLoc.dropTime!),
                                                style: TextStyle(
                                                  fontSize: b * 11.5,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          sh(5),
                          FutureBuilder(
                            future: HomeService.getSelfDrivingVehicles(),
                            builder: (context, snap) {
                              if (!(snap.connectionState ==
                                  ConnectionState.waiting)) {
                                int len = vehicleType == -1
                                    ? provider.availableModel.length
                                    : provider.availableModel.where((element) {
                                        if (element.typeId == vehicleType)
                                          return true;
                                        else
                                          return false;
                                      }).length;

                                if (len == 0)
                                  return noCarErrorWidget();
                                else
                                  return ListView.builder(
                                    padding: EdgeInsets.only(top: h * 5),
                                    shrinkWrap: true,
                                    itemCount: len,
                                    physics: NeverScrollableScrollPhysics(),
                                    itemBuilder: (context, index) {
                                      return InkWell(
                                        onTap: () {
                                          // dialogBoxDetail(
                                          //   context,
                                          //   vehicleType == -1
                                          //       ? provider.availableModel[index]
                                          //       : provider.availableModel
                                          //           .where((element) {
                                          //           if (element.typeId ==
                                          //               vehicleType) {
                                          //             return true;
                                          //           } else {
                                          //             return false;
                                          //           }
                                          //         }).toList()[index],
                                          // );
                                        },
                                        child: VehicleCard(
                                          fun: () {
                                            Navigator.of(context).push(
                                              MaterialPageRoute(
                                                builder: (context) => BookCar(
                                                  vehicle: vehicleType == -1
                                                      ? provider
                                                          .availableModel[index]
                                                      : provider.availableModel
                                                          .where((element) {
                                                          if (element.typeId ==
                                                              vehicleType)
                                                            return true;
                                                          else
                                                            return false;
                                                        }).toList()[index],
                                                  isUpdate: false,
                                                ),
                                              ),
                                            );
                                          },
                                          vehicle: vehicleType == -1
                                              ? provider.availableModel[index]
                                              : provider.availableModel
                                                  .where((element) {
                                                  if (element.typeId ==
                                                      vehicleType)
                                                    return true;
                                                  else
                                                    return false;
                                                }).toList()[index],
                                        ),
                                      );
                                    },
                                  );
                              } else {
                                return ListView.builder(
                                  padding: EdgeInsets.only(top: h * 5),
                                  shrinkWrap: true,
                                  itemCount: 5,
                                  physics: NeverScrollableScrollPhysics(),
                                  itemBuilder: (context, index) {
                                    // return VehicleCardShimmer();
                                    return Container();
                                  },
                                );
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Color(0xfff9f9f9),
                        width: b * 3,
                      ),
                    ),
                    height: h * 81,
                    child: FutureBuilder(
                      future: getClasses,
                      builder: (context, snap) {
                        print(snap.connectionState);
                        // if (snap.connectionState == ConnectionState.done) {
                        vehicleTypes.clear();
                        vehicleTypes.add(allVehicleType);
                        vehicleTypes.addAll(provider.vehicleType);

                        return ListView.builder(
                          physics: BouncingScrollPhysics(),
                          padding: EdgeInsets.symmetric(vertical: h * 8.2),
                          scrollDirection: Axis.horizontal,
                          itemCount: vehicleTypes.length,
                          itemBuilder: (context, index) {
                            final vehicleType = vehicleTypes[index];
                            return vehicleClassCard(vehicleType);
                          },
                        );
                        // } else {
                        //   return ListView.builder(
                        //     physics: BouncingScrollPhysics(),
                        //     padding: EdgeInsets.symmetric(vertical: h * 8.2),
                        //     scrollDirection: Axis.horizontal,
                        //     itemCount: 10,
                        //     itemBuilder: (context, index) {
                        //       return tempvehicleClassCard();
                        //     },
                        //   );
                        // }
                      },
                    ),
                  ),
                ],
              ),
            ),
          )
        ]),
      ),
    );
  }

  noCarErrorWidget() {
    var h = SizeConfig.screenHeight / 812;
    var b = SizeConfig.screenWidth / 375;

    return Center(
      child: Column(
        children: [
          sh(80),
          Image.asset(
            'assets/images/emptyHome_illus.png',
            width: b * 206,
            height: h * 139,
          ),
          sh(40),
          Text(
            BookCarNowLabel,
            style: TextStyle(
              fontSize: b * 24,
              fontWeight: FontWeight.w700,
            ),
          ),
          sh(10),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: b * 60),
            child: Text(
              HaveRideLabl,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: b * 14,
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget vehicleClassCard(VehicleType VehicleType) {
    var h = SizeConfig.screenHeight / 812;
    var b = SizeConfig.screenWidth / 375;

    return InkWell(
      onTap: () {
        setState(() {
          vehicleType = VehicleType.vehicleTypeId!;
        });
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: b * 6),
        alignment: Alignment.center,
        height: h * 58,
        width: b * 70,
        decoration: BoxDecoration(
          color: vehicleType == VehicleType.vehicleTypeId
              ? primaryColor
              : Color(0xfff9f9f9),
          borderRadius: BorderRadius.circular(4),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            VehicleType.name != AllLabel
                ? CachedNetworkImage(
                    imageUrl: VehicleType.icon!,
                    height: h * 26,
                  )
                : sh(0),
            Text(
              VehicleType.name!,
              style: TextStyle(
                fontSize: VehicleType.name == AllLabel ? b * 14 : b * 12,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget tempvehicleClassCard() {
    var h = SizeConfig.screenHeight / 812;
    var b = SizeConfig.screenWidth / 375;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: b * 6),
      alignment: Alignment.center,
      height: h * 58,
      width: b * 70,
      decoration: BoxDecoration(
        color: Color(0xfff9f9f9),
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }
}
