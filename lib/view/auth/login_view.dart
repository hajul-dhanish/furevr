import 'package:flutter/material.dart';
import 'package:furevr/component/custom_button_widget.dart';
import 'package:furevr/component/title_text.dart';
import 'package:furevr/routes/nav.dart';
import 'package:furevr/theme/color_palette.dart';
import 'package:furevr/theme/theme_provider.dart';
import 'package:furevr/view/dashboard/home_view.dart';
import 'package:provider/provider.dart';

class LoginView extends StatefulWidget {
  static String view = Navigation().loginView;
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passController = TextEditingController();
  bool isPassFieldVisible = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          const SizedBox(height: 10),
          titleText(
            "Hey you, zoophilist!",
          ),
          Text(
            "Welcome to the world of pets",
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          Image.asset(
            "assets/png/dog.png",
            height: MediaQuery.of(context).size.height * 0.35,
          ),
          const SizedBox(height: 10),
          usernameTextField(),
          passwordTextField(),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: AppButton(
              text: "Login",
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HomeView(),
                  ),
                );
              },
              options: appButtonOption(context, buttonColor: null),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {},
                  child: const SizedBox(
                    child: Text(
                      "New User? Sign in",
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: const SizedBox(
                    child: Text(
                      "Forgot Password",
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () =>
      //       Provider.of<ThemeProvider>(context, listen: false).toggleTheme(),
      //   child: const Icon(Icons.brightness_6),
      // ),
    );
  }

  Widget usernameTextField() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
      child: TextFormField(
        controller: usernameController,
        style: const TextStyle(fontSize: 14),
        decoration: InputDecoration(
          hintText: 'Username',
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
      ),
    );
  }

  Widget passwordTextField() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
      child: TextFormField(
        controller: passController,
        style: const TextStyle(fontSize: 14),
        obscureText: isPassFieldVisible,
        decoration: InputDecoration(
          hintText: 'Password',
          isDense: true,
          suffixIcon: IconButton(
              onPressed: () {
                isPassFieldVisible = !isPassFieldVisible;
                setState(() {});
              },
              icon: isPassFieldVisible
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
      ),
    );
  }
}
