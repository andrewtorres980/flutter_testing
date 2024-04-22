import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'auth_service.dart';
import 'button_component.dart';
import 'signin_screen.dart';
import 'textfield_component.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({super.key});
 final nameController = TextEditingController();
 final emailController = TextEditingController();
 final passwordController = TextEditingController();

 final nameFocus = FocusNode();
 final emailFocus = FocusNode();
 final passFocus = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SingleChildScrollView(
        child: AnnotatedRegion(
          value: SystemUiOverlayStyle(
            statusBarColor: Theme.of(context).scaffoldBackgroundColor,
            statusBarIconBrightness: Theme.of(context).brightness,
            systemNavigationBarColor: Theme.of(context).scaffoldBackgroundColor,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: 12),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: 110,),
                Center(
                  child: Text(
                    'Sign up',
                    style: TextStyle(
                        color: Theme.of(context).secondaryHeaderColor,
                        fontWeight: FontWeight.w600,
                        fontSize: 20),
                  ),
                ),
                SizedBox(height: 32),
                TextFieldComponent(
                  nameController,
                  currentFocus: nameFocus,
                  labelText: 'Name',
                  hintLabelText: 'Enter your name',
                  hintTextStyle: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Theme.of(context).hintColor),
                  labelColor: Theme.of(context).secondaryHeaderColor,
                  borderColor: Theme.of(context).splashColor,
                ),
                SizedBox(height: 24),
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
                SizedBox(height: 24),
              
                TextFieldComponent(
                  passwordController,
                  currentFocus: passFocus,
                  labelText: 'Password',
                  hintLabelText: 'Enter your password',
                  isPassword: true,
                  hintTextStyle: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                      color:Theme.of(context).hintColor),
                  labelColor: Theme.of(context).secondaryHeaderColor,
                  borderColor:Theme.of(context).splashColor,
                ),
                SizedBox(height: 100),
                ButtonComponent(
                  text: 'Sign Up',
                  onPressed: (){
                    AuthService().signUpWithEmailAndPassword(nameController.text, emailController.text, passwordController.text);
                  },
                ),
               
                SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already have an account?',
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 16.sp,
                          color: Theme.of(context).secondaryHeaderColor),
                    ),
                    GestureDetector(
                      onTap: () => Get.offAll(() => SigninScreen()),
                      child: Text(
                        ' Login',
                        style: TextStyle(
                            decoration: TextDecoration.underline,
                            fontWeight: FontWeight.w600,
                            fontSize: 16.sp,
                            color: Theme.of(context).primaryColor),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 26),
                RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                        text: ' By registering, you accept our ',
                        style: TextStyle(
                            fontSize: 13.sp,
                            color: Theme.of(context).secondaryHeaderColor,
                            fontWeight: FontWeight.w500),
                        children: [
                          TextSpan(
                              text: 'Terms & Conditions',
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                },
                              style: TextStyle(
                                  fontSize: 13.sp,
                                  color: Theme.of(context).primaryColor,
                                  fontWeight: FontWeight.w600)),
                          TextSpan(
                              text: ' and',
                              style: TextStyle(
                                  fontSize: 13.sp,
                                  color: Theme.of(context).secondaryHeaderColor,
                                  fontWeight: FontWeight.w400)),
                          TextSpan(
                              text: ' Privacy Policy',
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                },
                              style: TextStyle(
                                  fontSize: 13.sp,
                                  color: Theme.of(context).primaryColor,
                                  fontWeight: FontWeight.w600)),
                          TextSpan(
                              text: '.',
                              style: TextStyle(
                                  fontSize: 13.sp,
                                  color: Theme.of(context).secondaryHeaderColor,
                                  fontWeight: FontWeight.w400))
                        ])),
                        SizedBox(height: 60),
                Row(
                  children: [
                    Expanded(
                      child: Divider(
                        color: Theme.of(context).splashColor,
                        height: 10,
                        thickness: 1.0,
                      ),
                    ),
                     SizedBox(width: 12),
                    Text(
                      'Or',
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 16.sp,
                          color:Theme.of(context).hintColor),
                    ),
                     SizedBox(width: 12),
                    Expanded(
                      child: Divider(
                        color:Theme.of(context).splashColor,
                        height: 10,
                        thickness: 1.0,
                      ),
                    ),
                  ],
                ),
                 SizedBox(height: 26),
             ],
            ),
          ),
        ),
      ),
    );
  }
}
