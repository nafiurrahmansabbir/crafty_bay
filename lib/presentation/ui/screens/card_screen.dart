import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../state_holder/bottom_nav_bar_controller.dart';
import '../utils/app_colors.dart';
import '../widgets/cart/cart_item_widget.dart';

class CardScreen extends StatefulWidget {
  const CardScreen({super.key});

  @override
  State<CardScreen> createState() => _CardScreenState();
}

class _CardScreenState extends State<CardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Card'),
          leading: IconButton(
            onPressed: backToHome,
            icon: const Icon(Icons.arrow_back_ios),
          ),
        ),
        body: Column(
          children: [
            const SizedBox(
              height: 12,
            ),
            Expanded(
              child: ListView.separated(
                itemCount: 4,
                itemBuilder: (context, index) {
                  return CardItemWidget();
                },
                separatorBuilder: (_, __) => const SizedBox(
                  height: 8,
                ),
              ),
            ),
            _buildPriceAndAddToCardSection()
          ],
        ));
  }

  Widget _buildPriceAndAddToCardSection() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
          color: AppColors.themeColor.withOpacity(0.1),
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          )),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [_buildTotalPriceSection(context), _CheckOutButton()],
      ),
    );
  }

  Widget _buildTotalPriceSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Total Price',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const Text(
          '\$120000',
          style: TextStyle(fontSize: 17, color: AppColors.themeColor),
        )
      ],
    );
  }

  Widget _CheckOutButton() {
    return SizedBox(
        width: 140,
        child: ElevatedButton(onPressed: () {}, child: const Text('Checkout')));
  }

  void backToHome() {
    Get.find<BottomNavBarController>().backToHome();
  }
}
