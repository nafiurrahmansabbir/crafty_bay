import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../utils/assets_path.dart';
import 'appBar_icon_button.dart';

AppBar buildAppBarHome() {
  return AppBar(
    backgroundColor: Colors.white,
    title: SvgPicture.asset(AssetsPath.navLogoSVG),
    actions: [
      AppBarIconButton(
        iconData: Icons.person,
        onTap: () {},
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