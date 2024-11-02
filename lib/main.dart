import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:furevr/firebase/cloud_firestore.dart';
import 'package:furevr/firebase_options.dart';
import 'package:furevr/localization/app_localization.dart';
import 'package:furevr/routes/router.dart';
import 'package:furevr/theme/app_theme.dart';
import 'package:furevr/utils/global.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppLocalizations.initialize(const Locale('en'));
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
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
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      supportedLocales: const [
        Locale('en', 'US'),
        Locale('es', 'ES'),
      ],
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      title: Global.appName,
      theme: appTheme(),
      routerConfig: router,
    );
  }
}
