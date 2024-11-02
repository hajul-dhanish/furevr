import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:furevr/data/local/shared_pref.dart';
import 'package:furevr/utils/handler/snack_bar_widget.dart';
import 'package:furevr/view/auth/otp_auth_view.dart';
import 'package:furevr/view_model/user_vm/user_register_vm.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  Future<void> sendOTP(BuildContext context, {required String phoneNo}) async {
    try {
      ConfirmationResult result = await _auth.signInWithPhoneNumber(
        '+91$phoneNo',
      );
      if (context.mounted) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => OtpAuthView(
              confirmationResult: result,
            ),
          ),
        );
      }
    } on FirebaseAuthException catch (e) {
      if (context.mounted) {
        CustomSnackBar.show(
          context,
          alertType: AlertType.error,
          message: e.message!,
        );
      }
    }
  }

  Future<bool> verifyOTP(BuildContext context,
      ConfirmationResult confirmationResult, String otp) async {
    try {
      UserCredential userCredential = await confirmationResult.confirm(otp);
      if (context.mounted) {
        await UserRegisterViewModel().setUser(context, userCredential);
      }
      return true;
    } on FirebaseAuthException catch (e) {
      if (context.mounted) {
        CustomSnackBar.show(
          context,
          alertType: AlertType.error,
          message: e.message!,
        );
      }
      return false;
    }
  }

  Future<void> signOut(BuildContext context) async {
    try {
      await _auth.signOut();
    } on FirebaseException catch (e) {
      if (context.mounted) {
        CustomSnackBar.show(
          context,
          alertType: AlertType.error,
          message: e.message!,
        );
      }
    }
  }

  // Future<String?> registration({
  //   required String email,
  //   required String password,
  // }) async {
  //   try {
  //     await FirebaseAuth.instance.createUserWithEmailAndPassword(
  //       email: email,
  //       password: password,
  //     );
  //     return 'Success';
  //   } on FirebaseAuthException catch (e) {
  //     if (e.code == 'weak-password') {
  //       return 'The password provided is too weak.';
  //     } else if (e.code == 'email-already-in-use') {
  //       return 'The account already exists for that email.';
  //     } else {
  //       return e.message;
  //     }
  //   } catch (e) {
  //     return e.toString();
  //   }
  // }

  // Future<String?> login({
  //   required String email,
  //   required String password,
  // }) async {
  //   try {
  //     await FirebaseAuth.instance.signInWithEmailAndPassword(
  //       email: email,
  //       password: password,
  //     );
  //     return '200';
  //   } on FirebaseAuthException catch (e) {
  //     if (e.code == 'user-not-found') {
  //       return 'No user found for that email.';
  //     } else if (e.code == 'wrong-password') {
  //       return 'Wrong password provided for that user.';
  //     } else {
  //       return e.message;
  //     }
  //   } catch (e) {
  //     return e.toString();
  //   }
  // }

  // Future<String?> forgotPassword({
  //   required String email,
  // }) async {
  //   try {
  //     await FirebaseAuth.instance.sendPasswordResetEmail(
  //       email: email,
  //     );
  //     return '200';
  //   } on FirebaseAuthException catch (e) {
  //     if (e.code == 'user-not-found') {
  //       return 'No user found for that email.';
  //     } else if (e.code == 'wrong-password') {
  //       return 'Wrong password provided for that user.';
  //     } else {
  //       return e.message;
  //     }
  //   } catch (e) {
  //     return e.toString();
  //   }
  // }

  // Future<String?> confirmResetPassword({
  //   required String code,
  // }) async {
  //   try {
  //     await FirebaseAuth.instance.verifyPasswordResetCode(
  //       code,
  //     );
  //     return '200';
  //   } on FirebaseAuthException catch (e) {
  //     if (e.code == 'user-not-found') {
  //       return 'No user found for that email.';
  //     } else if (e.code == 'wrong-password') {
  //       return 'Wrong password provided for that user.';
  //     } else {
  //       return e.message;
  //     }
  //   } catch (e) {
  //     return e.toString();
  //   }
  // }

  // Future<String> guestSignin() async {
  //   try {
  //     await FirebaseAuth.instance.signInAnonymously();
  //     return '200';
  //   } on FirebaseAuthException catch (e) {
  //     if (e.code == 'user-not-found') {
  //       return 'No user found for that email.';
  //     } else if (e.code == 'wrong-password') {
  //       return 'Wrong password provided for that user.';
  //     } else {
  //       return e.message ?? "Somthing went wrong";
  //     }
  //   } catch (e) {
  //     return e.toString();
  //   }
  // }
}
