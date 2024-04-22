import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_testing/auth_service.dart';
import 'package:get/get.dart';

import 'button_component.dart';
import 'home_screen.dart';
import 'signup_screen.dart';
import 'textfield_component.dart';

class SigninScreen extends StatelessWidget {
  SigninScreen({super.key});

 final emailController = TextEditingController();
 final passwordController = TextEditingController();

 final emailFocus = FocusNode();
 final passFocus = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      resizeToAvoidBottomInset: true,
      body: AnnotatedRegion(
          value: SystemUiOverlayStyle(
            statusBarColor: Theme.of(context).scaffoldBackgroundColor,
            statusBarIconBrightness: Theme.of(context).brightness,
            systemNavigationBarColor: Theme.of(context).scaffoldBackgroundColor,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: 15),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 110),
                  Center(
                      child: Image.asset(
                    'assets/images/logo_carter.png',
                    width: 249,
                    height: 126,
                  )),
                  SizedBox(height: 45),
                  Text(
                    'Welcome back!',
                    style: TextStyle(
                        color: Theme.of(context).secondaryHeaderColor,
                        fontWeight: FontWeight.w600,
                        fontSize: 20.sp),
                  ),
                  SizedBox(height: 30),

                  TextFieldComponent(
                   emailController,
                    currentFocus: emailFocus,
                    labelText: 'Email',
                    hintLabelText: 'Enter your email',
                    hintTextStyle: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                        color:Theme.of(context).hintColor),
                    labelColor: Theme.of(context).secondaryHeaderColor,
                    borderColor:Theme.of(context).splashColor,
                  ),
                  SizedBox(height: 25),
                  TextFieldComponent(passwordController,
                      currentFocus: passFocus,
                      labelText: 'Password',
                      hintTextStyle: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w400,
                          color: Theme.of(context).hintColor),
                      hintLabelText: 'Enter your password',
                      labelColor: Theme.of(context).secondaryHeaderColor,
                      isPassword: true,
                      borderColor: Theme.of(context).splashColor),
                      SizedBox(height: 9),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () {
                         
                        },
                        child: Text('Forgot password?',
                            style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 12.sp,
                                color: Theme.of(context).secondaryHeaderColor)),
                      ),
                    ],
                  ),
                  SizedBox(height: 57),
                  ButtonComponent(
                    text: 'Log in',
                    onPressed: (){
                      AuthService().signInWithEmailAndPassword(emailController.text, passwordController.text);
                    },
                  ),
                  SizedBox(height: 55),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Don’t have an account?',
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16.sp,
                            color: Theme.of(context).secondaryHeaderColor),
                      ),
                      GestureDetector(
                        onTap: () => Get.offAll(() => SignupScreen()),
                        child: Text(
                          ' Create one',
                          style: TextStyle(
                              decoration: TextDecoration.underline,
                              fontWeight: FontWeight.w500,
                              fontSize: 16.sp,
                              color: Theme.of(context).primaryColor),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 60),
                  Row(
                    children: [
                      Expanded(
                        child: Divider(
                          color:Theme.of(context).splashColor,
                          height: 10,
                          thickness: 1.0,
                        ),
                      ),
                      SizedBox(height: 11),
                      Text(
                        'Or',
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 16.sp,
                            color:Theme.of(context).hintColor),
                      ),
                      SizedBox(height: 12),
                      Expanded(
                        child: Divider(
                          color:Theme.of(context).splashColor,
                          height: 10,
                          thickness: 1.0,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 25),
               ],
              ),
            ),
          )),
    );
  }
}
