import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:furevr/firebase/auth_service.dart';
import 'package:furevr/widget/otp_field/otp_text_field.dart';

class OtpAuthView extends StatefulWidget {
  final ConfirmationResult confirmationResult;
  const OtpAuthView({super.key, required this.confirmationResult});

  @override
  State<OtpAuthView> createState() => _OtpAuthViewState();
}

class _OtpAuthViewState extends State<OtpAuthView> {
  OtpFieldController otpController = OtpFieldController();
  ValueNotifier<bool> errorBorder = ValueNotifier(false);
  ValueNotifier<bool> isLoading = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0.0,
        automaticallyImplyLeading: false,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 32),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: const Icon(
                    Icons.arrow_back,
                    size: 32,
                    color: Colors.black54,
                  ),
                ),
              ),
              const SizedBox(height: 18),
              Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  color: Colors.deepPurple.shade50,
                  shape: BoxShape.circle,
                ),
                child: Image.asset(
                  'assets/images/illustration-1.png',
                ),
              ),
              const SizedBox(height: 24),
              const Text(
                'Verify with OTP',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                "Got the code? Punch it in to prove you’re not some AI overlord trying to take over the world. We’re watching you… 👀",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.black38,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 28),
              ValueListenableBuilder<bool>(
                  valueListenable: isLoading,
                  builder: (context, isLoad, _) {
                    return ValueListenableBuilder<bool>(
                        valueListenable: errorBorder,
                        builder: (context, isErrorBorder, _) {
                          return isLoad
                              ? const Center(
                                  child: CircularProgressIndicator(),
                                )
                              : Container(
                                  padding: const EdgeInsets.all(28),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: OTPTextField(
                                      controller: otpController,
                                      length: 6,
                                      width: MediaQuery.of(context).size.width,
                                      textFieldAlignment:
                                          MainAxisAlignment.spaceAround,
                                      fieldWidth: 45,
                                      fieldStyle: FieldStyle.box,
                                      outlineBorderRadius: 15,
                                      style: const TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      hasError: isErrorBorder,
                                      onChanged: (pin) {
                                        errorBorder.value = false;
                                      },
                                      onCompleted: (pin) async {
                                        isLoading.value = true;
                                        bool isDone =
                                            await AuthService().verifyOTP(
                                          context,
                                          widget.confirmationResult,
                                          pin,
                                        );
                                        isLoading.value = false;
                                        if (!isDone) {
                                          otpController.clear();
                                          errorBorder.value = true;
                                        }
                                      }),
                                );
                        });
                  }),
              const SizedBox(height: 18),
              const Text(
                "Didn't you receive any code?",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.black38,
                ),
                textAlign: TextAlign.center,
              ),
              TextButton(
                onPressed: () {},
                child: const Text("Resend code"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
