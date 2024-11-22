import 'package:carousel_slider/carousel_slider.dart';
import 'package:crafty_bay/presentation/state_holder/slider_list_controller.dart';
import 'package:crafty_bay/presentation/ui/widgets/center_circular_progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import '../../utils/app_colors.dart';

class HomeBannerCarouselSlider extends StatefulWidget {
  const HomeBannerCarouselSlider({
    super.key,
  });

  @override
  State<HomeBannerCarouselSlider> createState() =>
      _HomeBannerCarouselSliderState();
}

class _HomeBannerCarouselSliderState extends State<HomeBannerCarouselSlider> {
  final ValueNotifier<int> _selectedIndex = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SliderListController>(builder: (sliderListController) {
      return Visibility(
        visible: !sliderListController.inProgress,
        replacement: const SizedBox(
          height: 192,
          child: CenterCircularProgressIndicator(),
        ),
        child: Column(
          children: [
            CarouselSlider(
              options: CarouselOptions(
                viewportFraction: 0.9,
                  height: 180.0,
                  onPageChanged: (index, reason) {
                    _selectedIndex.value = index;
                  }),
              items: sliderListController.sliders.map((slider) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.symmetric(horizontal: 5.0),
                        decoration: BoxDecoration(
                          color: AppColors.themeColor,
                        ),


                        alignment: Alignment.center,
                        child: Stack(
                          children: [
                            Positioned.fill( // Ensures the image fills the container
                              child: Image.network(
                                slider.image.toString(),
                                fit: BoxFit.cover, // Makes the image cover the container without distortion
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Text(slider.title??''),
                                        const SizedBox(height: 7,),
                                        Text(slider.price ?? ''),
                                        const SizedBox(height: 10,),
                                        // Text(slider.shortDes??''),
                                        SizedBox(
                                          width: 80,
                                          child: ElevatedButton(
                                            onPressed: () {},
                                            child: Text('Buy Now'),
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor: Colors.white,
                                              foregroundColor: AppColors.themeColor,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ]
                        )
                        // child: Text('text $i', style: TextStyle(fontSize: 16.0),)
                        );
                  },
                );
              }).toList(),
            ),
            const SizedBox(
              height: 12,
            ),
            ValueListenableBuilder(
                valueListenable: _selectedIndex,
                builder: (context, currentIndex, _) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      for (int i = 0;
                          i < sliderListController.sliders.length;
                          i++)
                        Container(
                          height: 12,
                          width: 12,
                          margin: const EdgeInsets.only(right: 4),
                          decoration: BoxDecoration(
                              color: currentIndex == i
                                  ? AppColors.themeColor
                                  : null,
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(color: Colors.grey)),
                        )
                    ],
                  );
                })
          ],
        ),
      );
    });
  }

  @override
  void dispose() {
    _selectedIndex.dispose();
    super.dispose();
  }
}
