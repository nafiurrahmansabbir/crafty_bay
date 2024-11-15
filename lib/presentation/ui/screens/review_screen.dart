import 'package:crafty_bay/presentation/ui/screens/create_review_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../utils/app_colors.dart';

class ReviewScreen extends StatefulWidget {
  const ReviewScreen({super.key});

  @override
  State<ReviewScreen> createState() => _ReviewScreenState();
}

class _ReviewScreenState extends State<ReviewScreen> {
  late TextTheme textTheme = Theme.of(context).textTheme;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reviews'),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 16,
          ),
          Expanded(
            child: ListView.separated(
              itemCount: 6,
              itemBuilder: (context, index) {
                return Card(
                  color: Colors.white,
                  elevation: 1.5,
                  margin: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.account_circle,
                                color: Colors.grey,
                              )),
                          Text('User Name', style: textTheme.bodyLarge),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Row(
                          children: [
                            Expanded(
                                child: Text(
                                    'A cow is a domestic animal that is very common, and can be seen often. It is found worldwide in various sizes, shapes, and colours. The cow has two ears and eyes, one big nose, a long tail, four ',
                                    style: textTheme.bodyMedium
                                        ?.copyWith(color: Colors.grey))),
                          ],
                        ),
                      ),
                      const SizedBox(height: 26)
                    ],
                  ),
                );
              },
              separatorBuilder: (_, __) => const SizedBox(
                height: 12,
              ),
            ),
          ),
          _buildReviewsAndAddReviews()
        ],
      ),
    );
  }

  Widget _buildReviewsAndAddReviews() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
          color: AppColors.themeColor.withOpacity(0.090),
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          )),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [_buildReviewCountSection(), _buildAddReviewButton()],
      ),
    );
  }

  Widget _buildReviewCountSection() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Reviews',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(width: 10),
        const Text(
          '(1000)',
          style: TextStyle(fontSize: 17, color: AppColors.themeColor),
        )
      ],
    );
  }

  Widget _buildAddReviewButton() {
    return Container(
        decoration: BoxDecoration(
          color: AppColors.themeColor,
          borderRadius: BorderRadius.circular(100),
        ),
        child: IconButton(
          onPressed: _GoToCreateReviewScreen,
          icon: const Icon(
            Icons.add,
            color: Colors.white,
          ),
          color: AppColors.themeColor,
        ));
  }

  void _GoToCreateReviewScreen() {
    if (mounted) {
      Get.to(() => const CreateReviewScreen());
    }
  }
}
