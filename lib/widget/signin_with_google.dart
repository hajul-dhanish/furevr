// import 'package:flutter/material.dart';
// import 'package:furevr/firebase/auth_service.dart';
// import 'package:furevr/theme/color_palette.dart';
// import 'package:furevr/utils/handler/snack_bar_widget.dart';
// import 'package:furevr/utils/utils.dart';

// class SignInButtons extends StatelessWidget {
//   const SignInButtons({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         _buildSignInButton(
//           context,
//           label: 'Skip for now',
//           backgroundColor: ColorPalette.inActiveColor,
//           textColor: Colors.white,
//           onPressed: () async {
//             // String response = await AuthService().guestSignin();
//             if (context.mounted) {
//               // if (response == "200") {
//               String guestId = Utils().generateRandom6DigitNumber();
//                 await Utils().loginInit(context, guestId);
//               // } else {
//               //   CustomSnackBar.show(context, message: response);
//               // }
//             }
//           },
//         ),
//         const SizedBox(height: 16),
//         _buildSignInButton(
//           context,
//           label: 'Continue with Apple',
//           assetPath: 'https://cdn-icons-png.flaticon.com/512/154/154870.png',
//           backgroundColor: Colors.black,
//           textColor: Colors.white,
//           onPressed: () {
//             // Handle Apple sign-in
//           },
//         ),
//         const SizedBox(height: 16),
//         _buildSignInButton(
//           context,
//           label: 'Continue with Google',
//           assetPath: 'https://img.icons8.com/?size=512&id=17949&format=png',
//           backgroundColor: ColorPalette.actionColor,
//           textColor: Colors.white,
//           onPressed: () {
//             // Handle Google sign-in
//           },
//         ),
//       ],
//     );
//   }

//   Widget _buildSignInButton(
//     BuildContext context, {
//     required String label,
//     String? assetPath,
//     required Color backgroundColor,
//     required Color textColor,
//     required VoidCallback onPressed,
//   }) {
//     return SizedBox(
//       width: MediaQuery.of(context).size.width * 0.7,
//       child: ElevatedButton.icon(
//         onPressed: onPressed,
//         style: ElevatedButton.styleFrom(
//           foregroundColor: textColor,
//           backgroundColor: backgroundColor,
//           minimumSize: const Size(double.infinity, 50),
//           padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(30),
//           ),
//           elevation: 0,
//         ),
//         icon: assetPath != null
//             ? Image.network(
//                 assetPath,
//                 height: 24,
//                 width: 24,
//                 color: ColorPalette.white,
//                 fit: BoxFit.cover,
//               )
//             : null,
//         label: Text(
//           label,
//           style: TextStyle(
//             fontSize: 16,
//             color: textColor,
//             fontWeight: FontWeight.w600,
//           ),
//         ),
//       ),
//     );
//   }
// }
