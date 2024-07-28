import 'package:flutter/material.dart';
import 'package:furevr/component/custom_button_widget.dart';
import 'package:furevr/theme/theme_provider.dart';
import 'package:provider/provider.dart';

class InitialView extends StatelessWidget {
  const InitialView({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Hey you, zoophilist!\nWelcome to the world of pets",
            style: textTheme.bodyLarge,
            textAlign: TextAlign.center,
          ),
          Image.asset(
            "assets/png/dog.png",
            height: MediaQuery.of(context).size.height * 0.5,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: AppButton(
              text: "Login",
              onPressed: () {},
              options: appButtonOption(context, buttonColor: null),
            ),
          ),
          const SizedBox(height: 10),
          TextButton(
            child: Text(
              "New User? Sign UP",
              style: textTheme.bodyMedium,
            ),
            onPressed: () {},
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () =>
            Provider.of<ThemeProvider>(context, listen: false).toggleTheme(),
        child: const Icon(Icons.brightness_6),
      ),
    );
  }
}
