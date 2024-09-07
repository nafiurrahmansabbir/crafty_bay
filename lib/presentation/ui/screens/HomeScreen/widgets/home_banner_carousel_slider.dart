import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../../utils/app_colors.dart';

class HomeBannerCarouselSlider extends StatefulWidget {
  const HomeBannerCarouselSlider({
    super.key,
  });

  @override
  State<HomeBannerCarouselSlider> createState() => _HomeBannerCarouselSliderState();
}

class _HomeBannerCarouselSliderState extends State<HomeBannerCarouselSlider> {
  final ValueNotifier<int> _seledctedIndex = ValueNotifier(0);


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(height: 200.0,onPageChanged: (index,reason){
            _seledctedIndex.value=index;
          }),
          items: [1,2,3,4,5].map((i) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.symmetric(horizontal: 5.0),
                    decoration: const BoxDecoration(
                        color: AppColors.themeColor
                    ),
                    alignment: Alignment.center,
                    child: Text('text $i', style: const TextStyle(fontSize: 16.0),)
                  // child: Text('text $i', style: TextStyle(fontSize: 16.0),)
                );
              },
            );
          }).toList(),
        ),
        const SizedBox(height: 12,),
        ValueListenableBuilder(
          valueListenable: _seledctedIndex,
          builder: (context,currentIndex,_) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for(int i=0;i<5;i++)
                  Container(
                    height: 12,
                    width: 12,
                    margin: const EdgeInsets.only(right: 4),
                    decoration: BoxDecoration(
                        color: currentIndex==i ? AppColors.themeColor : null,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.grey)
                    ),
                  )
              ],
            );
          }
        )
      ],
    );
  }
  @override
  void dispose() {
    _seledctedIndex.dispose();
    super.dispose();
  }
}