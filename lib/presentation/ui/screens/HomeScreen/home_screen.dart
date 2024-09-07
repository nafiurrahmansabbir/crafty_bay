import 'package:carousel_slider/carousel_slider.dart';
import 'package:crafty_bay/presentation/ui/screens/HomeScreen/widgets/appBar_homePage.dart';
import 'package:crafty_bay/presentation/ui/screens/HomeScreen/widgets/home_banner_carousel_slider.dart';
import 'package:crafty_bay/presentation/ui/screens/HomeScreen/widgets/search_textfield.dart';
import 'package:crafty_bay/presentation/ui/utils/app_colors.dart';

import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

final TextEditingController _searchTEController =TextEditingController();

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBarHome(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            const SizedBox(height: 16),
            SearchTextField(textEditingController: _searchTEController,),
            const SizedBox(height: 16,),
            const HomeBannerCarouselSlider()
          ],
        ),
      ),
    );
  }
  @override
  void dispose() {
    _searchTEController.dispose();
    super.dispose();
  }
}




