import 'package:crafty_bay/presentation/ui/screens/email_verification_screen.dart';
import 'package:crafty_bay/presentation/ui/screens/HomeScreen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/app_logo_widget.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future<void> _moveToNextScreen() async{
    await Future.delayed(const Duration(seconds: 4));
    Get.off(()=>const HomeScreen());
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _moveToNextScreen();
  }
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Spacer(),
              AppLogoWidget(),
              Spacer(),
              CircularProgressIndicator(),
              SizedBox(height: 16,),
              Text('version 1.0.0')
            ],
          ),
        ),
      ),
    );
  }
}


