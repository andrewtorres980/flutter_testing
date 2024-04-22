import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_testing/home_screen.dart';
import 'package:flutter_testing/signin_screen.dart';
import 'package:get/get.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;


  // Sign up function
  Future<void> signUpWithEmailAndPassword(String name,String email, String password) async {
    try {
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
         
      String userId = userCredential.user!.uid;

      // Store user data in Firestore
      await _firestore.collection('users').doc(userId).set({
        'userID':userId,
        'name': name,
        'email': email,
        'password':password
      });
      Get.offAll(SigninScreen());
      print('User signed up successfully: ${userCredential.user?.email}');
       
    } catch (e) {
      print('Error signing up: $e');
    }
  }

  // Sign-in function
  Future<void> signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      Get.offAll(UserListScreen());
      print('User signed in successfully: ${userCredential.user?.email}');
    } catch (e) {
      print('Error signing in: $e');
    }
  }

  // Sign out function
  Future<void> signOut() async {
    try {
      await _auth.signOut();
      Get.to(SigninScreen());
      print('User signed out successfully');
    } catch (e) {
      print('Error signing out: $e');
    }
  }
 // Get the current user
    User? getCurrentUser() {
    return _auth.currentUser;
  }

  // Stream of authentication state changes
  Stream<User?> authStateChanges() {
    return _auth.authStateChanges();
  }
}
