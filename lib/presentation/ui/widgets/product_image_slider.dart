import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import '../utils/app_colors.dart';
import '../utils/assets_path.dart';

class ProductImageCarouselSlider extends StatefulWidget {
  const ProductImageCarouselSlider({
    super.key,
  });

  @override
  State<ProductImageCarouselSlider> createState() =>
      _ProductImageCarouselSliderState();
}

class _ProductImageCarouselSliderState
    extends State<ProductImageCarouselSlider> {
  final ValueNotifier<int> _selectedIndex = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [

        Column(
          children: [
            CarouselSlider(
              options: CarouselOptions(
                height: 200.0,
                onPageChanged: (index, reason) {
                  _selectedIndex.value = index;
                },
                viewportFraction: 1,

              ),
              items: [1, 2, 3, 4, 5].map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                       decoration: BoxDecoration(
                         color: Colors.grey.shade200,
                         image: const DecorationImage(image: AssetImage(AssetsPath.dummyShoe))
                       ),
                    );
                  },
                );
              }).toList(),
            ),
          ],
        ),
        Positioned(
          bottom: 12,
          left: 0,
          right: 0,
          child: ValueListenableBuilder(
              valueListenable: _selectedIndex,
              builder: (context, currentIndex, _) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    for (int i = 0; i < 5; i++)
                      Container(
                        height: 12,
                        width: 12,
                        margin: const EdgeInsets.only(right: 4),
                        decoration: BoxDecoration(
                            color:
                            currentIndex == i ? AppColors.themeColor : Colors.white,
                            borderRadius: BorderRadius.circular(12),
                        ),
                      )
                  ],
                );
              }),
        ),

      ]
    );
  }

  @override
  void dispose() {
    _selectedIndex.dispose();
    super.dispose();
  }
}
