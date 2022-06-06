import 'package:bootcamp165/size_config.dart';
import 'package:flutter/material.dart';


const kPrimaryColor = Color(0xFFFF7643);

const homePageTextColor=Color(0XFFE39C86);

Text  homePageTextWidget(String str){
  return Text(str,style: TextStyle(color: homePageTextColor,fontSize: 14,fontWeight: FontWeight.bold),);
}

Image homePageImagesWidget(String str){
  return Image.asset("assets/images/homepageimages/"+str);
}



//const homePageTextStlye=TextStyle()

 BoxDecoration homePageBoxDecoration = BoxDecoration(
    color: Color(0XFFFFFFFF),
    borderRadius: BorderRadius.circular(16.0),
    boxShadow: [
      BoxShadow(
        color: homePageTextColor,
        offset: Offset.fromDirection(5.0),
        blurRadius: 10.0,
      )
    ]);


const kPrimaryLightColor = Color(0xFFFFECDF);
const kPrimaryGradientColor = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [Color(0xFFFFA53E), Color(0xFFFF7643)],
);
const kSecondaryColor = Color(0xFF979797);
const kTextColor = Color(0xFF757575);

const kAnimationDuration = Duration(milliseconds: 200);

final headingStyle = TextStyle(
  fontSize: getProportionateScreenWidth(28),
  fontWeight: FontWeight.bold,
  color: Colors.black,
  height: 1.5,
);

const defaultDuration = Duration(milliseconds: 250);

// Form Error
final RegExp emailValidatorRegExp =
    RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
const String kEmailNullError = "Please Enter your email";
const String kInvalidEmailError = "Please Enter Valid Email";
const String kPassNullError = "Please Enter your password";
const String kShortPassError = "Password is too short";
const String kMatchPassError = "Passwords don't match";
const String kNamelNullError = "Please Enter your name";
const String kPhoneNumberNullError = "Please Enter your phone number";
const String kAddressNullError = "Please Enter your address";

final otpInputDecoration = InputDecoration(
  contentPadding:
      EdgeInsets.symmetric(vertical: getProportionateScreenWidth(15)),
  border: outlineInputBorder(),
  focusedBorder: outlineInputBorder(),
  enabledBorder: outlineInputBorder(),
);

OutlineInputBorder outlineInputBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(getProportionateScreenWidth(15)),
    borderSide: BorderSide(color: kTextColor),
  );
}