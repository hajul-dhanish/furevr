import 'package:flutter/material.dart';
import 'package:furevr/component/title_text.dart';
import 'package:furevr/theme/theme_provider.dart';
import 'package:provider/provider.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({super.key});

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: titleText("Settings"),
      ),
      body: Column(
        children: [
          ListTile(
            onTap: () {
              // floatingActionButton: FloatingActionButton(
              //   onPressed: () =>
              Provider.of<ThemeProvider>(context, listen: false).toggleTheme();
              //   child: const Icon(Icons.brightness_6),
              // ),
            },
            title: Text("Theme Mode : "),
            trailing: Icon(Icons.light_mode),
          )
        ],
      ),
    );
  }
}
