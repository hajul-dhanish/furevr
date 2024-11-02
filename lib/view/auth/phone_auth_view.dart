import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:furevr/component/custom_button_widget.dart';
import 'package:furevr/firebase/auth_service.dart';
import 'package:furevr/theme/color_palette.dart';
import 'package:furevr/utils/utils.dart';

class PhoneAuthView extends StatefulWidget {
  const PhoneAuthView({super.key});

  @override
  State<PhoneAuthView> createState() => _PhoneAuthViewState();
}

class _PhoneAuthViewState extends State<PhoneAuthView> {
  ValueNotifier<bool> showTextSuffix = ValueNotifier(false);
  TextEditingController controller = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(toolbarHeight: 0.0),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                color: ColorPalette.primary.withOpacity(0.2),
                shape: BoxShape.circle,
              ),
              child: Image.asset(
                'assets/images/illustration-1.png',
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'Welcome to the world of pets',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              "Drop your digits, fam! We’ll slide into your messages with a code to make sure you’re not a bot. 💀",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.black38,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 28),
            ValueListenableBuilder<bool>(
                valueListenable: showTextSuffix,
                builder: (context, showPrefix, _) {
                  return Container(
                    padding: const EdgeInsets.all(28),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      children: [
                        Form(
                          key: _formKey,
                          child: TextFormField(
                            controller: controller,
                            keyboardType: TextInputType.phone,
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(10),
                              FilteringTextInputFormatter
                                  .digitsOnly, // Allow only digits
                            ],
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                            onChanged: (val) {
                              if (Utils.validatePhoneNumber(val)) {
                                showTextSuffix.value = true;
                              } else {
                                showTextSuffix.value = false;
                              }
                            },
                            decoration: InputDecoration(
                              isDense: true,
                              filled: true,
                              prefix: const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 8),
                                child: Text(
                                  '(+91)',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                              suffixIcon: showPrefix
                                  ? const Icon(
                                      Icons.check_circle,
                                      color: Colors.green,
                                      size: 32,
                                    )
                                  : null,
                            ),
                            validator: (value) {
                              if (value == null ||
                                  value.isEmpty ||
                                  !showPrefix) {
                                return "Did you forget something, or is this your usual level of commitment?";
                              }
                              return null;
                            },
                          ),
                        ),
                        const SizedBox(height: 22),
                        AppButton(
                          text: "Send OTP",
                          onPressed: () async {
                            if (_formKey.currentState?.validate() ?? false) {
                              String mobileNo = controller.text.trim();
                              await AuthService()
                                  .sendOTP(context, phoneNo: mobileNo);
                            }
                          },
                          options: appButtonOption(context),
                        ),
                      ],
                    ),
                  );
                }),
          ],
        ),
      ),
    );
  }
}
