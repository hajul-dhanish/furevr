import 'package:flutter/material.dart';
import 'package:furevr/utils/utils.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              ListTile(
                leading: const Icon(Icons.logout_rounded),
                title: const Text('Logout'),
                trailing: const Icon(Icons.arrow_right_alt),
                onTap: () {
                  Utils().appLoutOut(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  tileWidget() {}
}
