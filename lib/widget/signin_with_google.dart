import 'package:flutter/material.dart';
import 'package:furevr/theme/color_palette.dart';

class SignInButtons extends StatelessWidget {
  const SignInButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildSignInButton(
          label: 'Continue with Apple',
          assetPath: 'https://cdn-icons-png.flaticon.com/512/154/154870.png',
          backgroundColor: Colors.black,
          textColor: Colors.white,
          onPressed: () {
            // Handle Apple sign-in
          },
        ),
        const SizedBox(height: 16),
        _buildSignInButton(
          label: 'Continue with Google',
          assetPath: 'https://img.icons8.com/?size=512&id=17949&format=png',
          backgroundColor: Colors.black,
          textColor: Colors.white,
          onPressed: () {
            // Handle Google sign-in
          },
        ),
      ],
    );
  }

  Widget _buildSignInButton({
    required String label,
    required String assetPath,
    required Color backgroundColor,
    required Color textColor,
    required VoidCallback onPressed,
  }) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        foregroundColor: textColor,
        backgroundColor: backgroundColor,
        minimumSize: const Size(double.infinity, 50),
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        elevation: 0,
      ),
      icon: Image.network(
        assetPath,
        height: 24,
        width: 24,
        color: ColorPalette.white,
        fit: BoxFit.cover,
      ),
      label: Text(
        label,
        style: TextStyle(
          fontSize: 16,
          color: textColor,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
