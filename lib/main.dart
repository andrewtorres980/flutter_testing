import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_testing/auth_service.dart';
import 'package:flutter_testing/home_screen.dart';
import 'package:get/get.dart';
import 'app_colors.dart';
import 'signin_screen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(437, 969),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, child) {
          return GetMaterialApp(
              debugShowCheckedModeBanner: false,
              theme: AppColors.lightTheme,
              darkTheme: AppColors.darkTheme,
              home:  StreamBuilder<User?>(
        stream: AuthService().authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            User? user = snapshot.data;
            // If the user is logged in, navigate to the home screen
            if (user != null) {
              return UserListScreen();
            } else {
              // If the user is not logged in, navigate to the login screen
              return SigninScreen();
            }
          }
          // Show a loading indicator while waiting for authentication state
          return Center(child: CircularProgressIndicator());
        },
      ),
);
        });
  }
}
