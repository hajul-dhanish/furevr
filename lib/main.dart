import 'package:flutter/material.dart';
import 'package:furevr/theme/app_theme.dart';
import 'package:furevr/theme/theme_provider.dart';
import 'package:furevr/utils/global.dart';
import 'package:furevr/view/auth/login_view.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const Furevr());
}

class Furevr extends StatefulWidget {
  const Furevr({super.key});

  @override
  State<Furevr> createState() => _FurevrState();
}

class _FurevrState extends State<Furevr> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ThemeProvider>(
      create: (_) => ThemeProvider(),
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: Global.appName,
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            themeMode: themeProvider.themeMode,
            home: const LoginView(),
          );
        },
      ),
    );
  }
}
