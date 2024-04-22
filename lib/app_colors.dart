import 'package:flutter/material.dart';

class AppColors {
  static const buttonColor = Color(0xff1A5091);
  static const buttonTextColor = Colors.white;

  static const labelColor = Color(0xffD7D7D7);
  static const lgcardColor = Color(0xffD7EEF2);
  static const switchBtnColor = Color(0xffD6D6D6);

  static const lgtxtColors = Color(0xff222222);
  static const lightRatingColor = Color(0xff656565);
  static const govtContColor = Color(0xFFF6F6F6);
  static const arrowColor = Color(0xFF545454);
  static const deleteBtnColor = Color(0xFFFD554A);

  static const dktxtColors = Colors.white;
  static const dkcardColor = Color(0xff666666);
  static const List<Color> lightcardGradient = [
    Color(0xffD7EEF2),
    Color(0xffE9F3FF),
  ];
  static const List<Color> darkCardGradient = [
    Color(0xff666666),
    Color(0xff16191D),
  ];

  static ThemeData lightTheme = ThemeData(
      fontFamily: 'poppin',
      primaryColor: const Color(0xff1A5091), //use for all things
      scaffoldBackgroundColor: Colors.white, // for background screen
      disabledColor: const Color(0xffACB1B7),
      secondaryHeaderColor: const Color(0xff222222), //use for text color
      brightness: Brightness.dark,
      hintColor: const Color(0xff666666),
      primaryColorLight: const Color(0xFFDFDFDF),
      indicatorColor: const Color(0xffFF2929), // use for Celeander
      shadowColor: const Color(0xffF3F3F3), //Use For shadow in container
      hoverColor: const Color(0xff028EE6), //Use For Chat as Sender
      focusColor: const Color(0xFF1877F2),

      //dividerColor: const Color(0xFF1877F2),
      // Color? dialogBackgroundColor,
      // Color? cardColor,
      // Color? dividerColor,
      // Color? primaryColorDark,
      // Color? shadowColor,
      splashColor: const Color(0xFFDEDEDE),
      // Color? unselectedWidgetColor,
      cardColor: const Color(0Xffffffff),
      highlightColor: Colors.white);

  static ThemeData darkTheme = ThemeData(
      primaryColor: const Color(0xff1A5091), //use for all things
      scaffoldBackgroundColor: Colors.black, // for background screen
      disabledColor: const Color(0xffACB1B7),
      secondaryHeaderColor: Colors.white, //use for text color
      brightness: Brightness.light,
      primaryColorLight: const Color(0xFFDFDFDF),
      hintColor: const Color(0xff666666),
      indicatorColor: const Color(0xffFF2929), // use for Celeander
      shadowColor: const Color(0xffF3F3F3), //Use For shadow in container
      hoverColor: const Color(0xff028EE6), //Use For Chat as Sender

      highlightColor: const Color(0xff424242), // use for textfielE

      cardColor: const Color(0xff1E1E1E) // card color

      );
  // Color? dialogBackgroundColor,
  // Color? cardColor,
  // Color? dividerColor,
  // Color? primaryColorDark,
  // Color? shadowColor,
  // Color? splashColor,
  // Color? unselectedWidgetColor,
}
