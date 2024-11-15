import 'package:crafty_bay/presentation/ui/utils/assets_path.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';

class AppLogoWidget extends StatelessWidget {
  const AppLogoWidget({
    super.key,
    // required this.LogoWidth,
  });
// final double LogoWidth=120;
  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(AssetsPath.appLogoSVG,width: 120,);
  }
}