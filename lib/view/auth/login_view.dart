import 'package:flutter/material.dart';
import 'package:furevr/component/custom_button_widget.dart';
import 'package:furevr/component/title_text.dart';
import 'package:furevr/firebase/auth_service.dart';
import 'package:furevr/localization/app_string.dart';
import 'package:furevr/theme/app_theme.dart';
import 'package:furevr/utils/utils.dart';
import 'package:furevr/widget/signin_with_google.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  bool isPassFieldObscured = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          const SizedBox(height: 10),
          titleText(AppStrings.loginViewTitleText),
          Text(
            AppStrings.loginViewWelcomeText,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const SizedBox(height: 10),
          Form(
            key: _formKey,
            child: Column(
              children: [
                usernameTextField(),
                passwordTextField(),
              ],
            ),
          ),
          const SizedBox(height: 10),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: AppButton(
              text: AppStrings.loginViewLoginButtonText,
              onPressed: () async {
                if (_formKey.currentState?.validate() ?? false) {
                  String userName =
                      usernameController.text.trim().toLowerCase();

                  final message = await AuthService().login(
                    email: userName,
                    password: passController.text,
                  );
                  if (message == "200") {
                    if (context.mounted) {
                      await Utils().loginInit(context, userName);
                    }
                  }
                }
              },
              options: appButtonOption(context),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {},
                  child: SizedBox(
                    child: Text(
                      AppStrings.loginViewLoginSignUpButtonText,
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: SizedBox(
                    child: Text(
                      AppStrings.loginViewLoginForgotPassText,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("------ or ------"),
            ],
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
            child: SignInButtons(),
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Text(
          "@${Utils.getCurrentYear} | Powered by tifltailes.com",
          textAlign: TextAlign.center,
          style: CustomTextStyles.captionNormal,
        ),
      ),
    );
  }

  clearTextFields() {
    usernameController.clear();
    passController.clear();
  }

  Widget usernameTextField() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
      child: TextFormField(
        controller: usernameController,
        style: const TextStyle(fontSize: 14),
        decoration: InputDecoration(
          hintText: AppStrings.loginViewLoginUsernameFieldTitleText,
          isDense: true,
          hintStyle: const TextStyle(fontSize: 16),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(
              width: 0.6,
              style: BorderStyle.none,
            ),
          ),
          filled: true,
          contentPadding: const EdgeInsets.all(16),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "This field is empty, kind of like your energy on Monday mornings";
          }
          return null;
        },
      ),
    );
  }

  Widget passwordTextField() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
      child: TextFormField(
        controller: passController,
        style: const TextStyle(fontSize: 14),
        obscureText: isPassFieldObscured,
        decoration: InputDecoration(
          hintText: AppStrings.loginViewLoginPasswordFieldTitleText,
          isDense: true,
          suffixIcon: IconButton(
              onPressed: () {
                isPassFieldObscured = !isPassFieldObscured;
                setState(() {});
              },
              icon: isPassFieldObscured
                  ? const Icon(Icons.visibility)
                  : const Icon(Icons.visibility_off)),
          hintStyle: const TextStyle(fontSize: 16),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(
              width: 0.6,
              style: BorderStyle.none,
            ),
          ),
          filled: true,
          contentPadding: const EdgeInsets.all(16),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "Did you forget something, or is this your usual level of commitment?";
          }
          return null;
        },
      ),
    );
  }
}
