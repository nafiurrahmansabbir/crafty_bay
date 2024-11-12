import 'package:crafty_bay/presentation/ui/screens/email_verification_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../utils/assets_path.dart';
import 'appBar_icon_button.dart';

AppBar buildAppBarHome() {
  return AppBar(
    backgroundColor: Colors.white,
    title: SvgPicture.asset(AssetsPath.navLogoSVG),
    actions: [
      AppBarIconButton(
        iconData: Icons.person,
        onTap: () {
          Get.to(()=>const EmailVerificationScreen());
        },
      ),
      const SizedBox(width: 8),
      AppBarIconButton(
        iconData: Icons.call,
        onTap: () {},
      ),
      const SizedBox(width: 8),
      AppBarIconButton(
        iconData: Icons.notifications_active_outlined,
        onTap: () {},
      ),
      const SizedBox(width: 8),
    ],
  );
}