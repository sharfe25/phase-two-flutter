import 'package:flutter/material.dart';
import 'package:phase_two_flutter/components/tokens/app_text_styles.dart';

import '../../tokens/app_colors.dart';
import '../../tokens/app_spacing.dart';

class WelcomeCard extends StatelessWidget {
  const WelcomeCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      margin: const EdgeInsets.only(
        top: AppSpacing.small,
      ),
      padding: const EdgeInsets.all(AppSpacing.large),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: const Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Explore',
              style: AppTextStyles.title,
            ),
            Text(
              'Welcome to Fake Store.',
              style: AppTextStyles.subtitle,
            )
          ]),
    );
  }
}
