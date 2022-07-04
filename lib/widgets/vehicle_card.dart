import 'package:flutter/material.dart';
import 'package:flutter_app/models/vehicle_model.dart';
import 'package:flutter_app/utils/colors.dart';
import 'package:flutter_app/utils/sizeConfig.dart';
import 'package:flutter_app/utils/strings.dart';
import 'package:flutter_app/widgets/cached_image.dart';
import 'package:flutter_app/widgets/custom_button.dart';

class VehicleCard extends StatelessWidget {
  const VehicleCard({Key? key, @required this.vehicle, this.fun})
      : super(key: key);

  final VehicleModel? vehicle;
  final Function()? fun;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    var h = SizeConfig.screenHeight / 812;
    var b = SizeConfig.screenWidth / 375;

    return Container(
      margin: EdgeInsets.only(
        right: b * 15,
        bottom: h * 10,
        left: b * 15,
      ),
      padding: EdgeInsets.fromLTRB(
        b * 5,
        h * 20,
        b * 15,
        h * 20,
      ),
      decoration: BoxDecoration(
        boxShadow: boxShadow2,
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(10),
          bottomRight: Radius.circular(10),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Hero(
                tag: vehicle!.vehicleId!.toString(),
                child: CachedImage(
                  imgUrl: vehicle!.photo!,
                  height: h * 95,
                  isGallery: false,
                  width: b * 148,
                  vehicleId: vehicle!.vehicleId.toString(),
                ),
              ),
              sb(24),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            vehicle!.vehicleName!,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: b * 14,
                            ),
                          ),
                        ),
                        InkWell(
                          // onTap: () {
                          //   dialogBoxDetail(context, vehicle!);
                          // },
                          child: Icon(
                            Icons.info_outline,
                            color: secondaryColor,
                            size: b * 16,
                          ),
                        ),
                      ],
                    ),
                    sh(10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          'Cijena po km:',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: b * 12,
                            color: Color(0xff3f3d56),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text(
                            vehicle!.price!.toString() + ' KM',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: b * 12,
                              fontWeight: FontWeight.w700,
                              color: Color(0xffa7a7a7),
                            ),
                          ),
                        ),
                      ],
                    ),
                    sh(3),
                    sh(11),
                    CustomButton(
                      label: BookNowLabel,
                      vertPad: h * 10,
                      onPressed: this.fun,
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
