import 'dart:ffi';

import 'package:flutter/cupertino.dart';

class Userinfo {
  int? id;
  @required
  String? firstName;
  @required
  String? lastName;
  @required
  String? userType;
  @required
  DateTime? userCreatedTime;
  @required
  Bool? isActive;
  @required
  Bool? verifiedAccount;
  String? refreshTOken;
  int? locationId;
  String? userName;
  int? pin;
  String? phoneNumber;
  String? email;
  //String? password;
  String? phoneCode;
  String? photoUrl;
  int? phoneNumberConfirmed;
  int? emailConfirmed;
  //String? address;
  //String? nationality;
  //String? docType;

  Userinfo(
      {this.id,
      this.userName,
      this.phoneNumber,
      this.phoneCode,
      this.email,
      // this.password,
      this.photoUrl,
      this.firstName,
      this.lastName,
      this.isActive,
      this.phoneNumberConfirmed,
      this.userCreatedTime,
      //this.docType,
      this.locationId,
      this.pin,
      this.userType,
      this.refreshTOken,
      this.verifiedAccount,
      this.emailConfirmed});

  Userinfo.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    firstName = json['FirstName'];
    lastName = json['LastName'];
    locationId = json['LocationId'] ?? 0;
    pin = json['Pin'] ?? 0;
    userName = json['user_name'] ?? json['name'];
    userType = json['UserType'];
    phoneCode = json['phone_code'] ?? "+91";
    email = json['Email'] ?? json['email'];
    refreshTOken = json['RefreshToken'] ?? "";
    photoUrl = json['PhotoUrl'] ?? "";
    isActive = json['IsActive'] ?? 1;
    phoneNumberConfirmed = json['PhoneNumberConfirmed'] ?? 0;
    userCreatedTime = json['UserCreatedTime'];
    verifiedAccount = json['VerifiedAccount'] ?? 0;
    emailConfirmed = json['EmailConfirmed'] ?? 0;
    phoneNumber = json['PhoneNumber'] ?? '';
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['user_id'] = this.userId;
  //   data['api_token'] = this.apiToken;
  //   data['fcm_id'] = this.fcmId;
  //   data['device_token'] = this.deviceToken;
  //   data['socialmedia_uid'] = this.socialmediaUid;
  //   data['user_name'] = this.userName;
  //   data['phone'] = this.phone;
  //   data['phone_code'] = this.phoneCode;
  //   data['emailid'] = this.emailid;
  //   data['password'] = this.password;
  //   data['profile_pic'] = this.profilePic;
  //   data['status'] = this.status;
  //   data['phone_verified'] = this.phoneVerified;
  //   data['timestamp'] = this.timestamp;
  //   return data;
  // }
}
