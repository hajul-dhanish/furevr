import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:furevr/data/local/shared_pref.dart';
import 'package:furevr/model/user_model/user_register_db_model.dart';
import 'package:furevr/repository/user_repo/user_register_repo.dart';
import 'package:furevr/utils/handler/snack_bar_widget.dart';
import 'package:furevr/utils/utils.dart';
import 'package:furevr/view/auth/register_view.dart';

class UserRegisterViewModel extends ChangeNotifier {
  final userRegRepository = UserRegisterRepo();

  Future<void> setUser(BuildContext context, UserCredential userCreds) async {
    try {
      UserRegisterModel userRegData = UserRegisterModel(
        phoneNumber: userCreds.user?.phoneNumber,
        creationTime: userCreds.user?.metadata.creationTime.toString(),
        lastSignInTime: userCreds.user?.metadata.lastSignInTime.toString(),
        displayName: userCreds.user?.displayName,
        isEmailVerified: userCreds.user?.emailVerified,
        isNewUser: userCreds.additionalUserInfo?.isNewUser,
        uid: userCreds.user?.uid,
        email: userCreds.user?.email,
        userId: userCreds.user?.phoneNumber,
      );
      await UserSharedPreferences().setUserIdPref(userId: userRegData.userId!);

      if (userRegData.isNewUser ?? false) {
        await userRegRepository.addUserRigister(userRegData.toJson());
        if (context.mounted) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const RegisterView(),
            ),
          );
        }
      } else {
        await userRegRepository.updateUserRigister(userRegData.toJson());
        if (context.mounted) {
          await Utils().loginInit(
              context, userRegData.displayName ?? "", userRegData.userId ?? "");
        }
      }
    } catch (e) {
      if (context.mounted) {
        CustomSnackBar.show(
          context,
          alertType: AlertType.error,
          message: e.toString(),
        );
      }
    }
  }
}
