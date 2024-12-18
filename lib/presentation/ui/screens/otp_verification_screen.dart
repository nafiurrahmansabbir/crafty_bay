import 'package:crafty_bay/presentation/ui/screens/complete_profile_screen.dart';
import 'package:crafty_bay/presentation/ui/utils/app_colors.dart';
import 'package:crafty_bay/presentation/ui/widgets/app_logo_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../state_holder/controller/countdown_controller.dart';

class OTPVerificationScreen extends StatefulWidget {
  const OTPVerificationScreen({super.key});

  @override
  State<OTPVerificationScreen> createState() => _OTPVerificationScreenState();
}

class _OTPVerificationScreenState extends State<OTPVerificationScreen> {
  final TextEditingController _oTPTeController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final CountdownController countdownController =
      Get.put(CountdownController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const SizedBox(height: 82),
                const AppLogoWidget(),
                const SizedBox(height: 24),
                Text(
                  'Enter OTP Code',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                Text(
                  'A 4 Digit OTP Code has been Sent',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: Colors.black45,
                      ),
                ),
                const SizedBox(height: 16),
                PinCodeTextField(
                  length: 6,
                  animationType: AnimationType.fade,
                  keyboardType: TextInputType.number,
                  pinTheme: PinTheme(
                    shape: PinCodeFieldShape.box,
                    borderRadius: BorderRadius.circular(5),
                    fieldHeight: 50,
                    fieldWidth: 40,
                    activeFillColor: Colors.white,
                    activeColor: Colors.green,
                    inactiveFillColor: Colors.white,
                    inactiveColor: AppColors.themeColor,
                  ),
                  animationDuration: const Duration(milliseconds: 300),
                  backgroundColor: Colors.transparent,
                  controller: _oTPTeController,
                  appContext: context,
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      //ToDo Valid hoile kaj koro nnaile muri khu
                      _onTapCompleteProfileScreen();
                    }
                  },
                  child: const Text('Next'),
                ),
                const SizedBox(height: 16),
                Obx(() => RichText(
                        text: TextSpan(
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge
                                ?.copyWith(color: Colors.grey),
                            text: 'This code will expire in ',
                            children: [
                          TextSpan(
                              text:
                                  '${countdownController.remainingSeconds.value}s',
                              style: TextStyle(
                                color: AppColors.themeColor,
                              ))
                        ]))),
                TextButton(onPressed: () {}, child: const Text('Resend Code'))
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _onTapCompleteProfileScreen() {
    if (mounted) {
      Get.to(() => const CompleteProfileScreen());
    }
  }

  @override
  void dispose() {
    _oTPTeController.dispose();
    super.dispose();
  }
}
