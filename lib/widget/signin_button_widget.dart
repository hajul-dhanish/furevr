library google_sign_in_button;

import 'package:flutter/material.dart';

const _packageName = 'google_sign_in_button';

/// A Google Sign-in button, as per their branding guidelines.
///
/// See https://developers.google.com/identity/branding-guidelines.
class GoogleSignInButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Brightness brightness;

  const GoogleSignInButton({
    super.key,
    required this.onPressed,
    this.brightness = Brightness.light,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40.0,
      child: Material(
        elevation: 1.0,
        color: _backgroundColor,
        child: InkWell(
          onTap: onPressed,
          splashColor: Colors.black12,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                width: 38.0,
                height: 38.0,
                margin: const EdgeInsets.only(left: 1.0, top: 1.0, bottom: 1.0),
                color: const Color(0xFFFFFFFF),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Image.asset(
                    'assets/images/google_logo.png',
                    package: _packageName,
                  ),
                ),
              ),
              const SizedBox(width: 14.0),
              Text(
                'Sign in with Google',
                style: TextStyle(
                  package: _packageName,
                  color: _textColor,
                  fontSize: 14.0,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(width: 8.0),
            ],
          ),
        ),
      ),
    );
  }

  Color get _backgroundColor {
    switch (brightness) {
      case Brightness.light:
        return const Color(0xFFFFFFFF);
      case Brightness.dark:
        return const Color(0xFF4285F4);
      default:
        throw Exception('Invalid Brightness: $brightness');
    }
  }

  Color get _textColor {
    switch (brightness) {
      case Brightness.light:
        return Colors.black.withOpacity(0.54);
      case Brightness.dark:
        return const Color(0xFFFFFFFF);
      default:
        throw Exception('Invalid Brightness: $brightness');
    }
  }
}
