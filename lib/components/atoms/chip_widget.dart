import 'package:flutter/material.dart';
import 'package:phase_two_flutter/components/tokens/app_text_styles.dart';
import 'package:phase_two_flutter/utils/string_utils.dart';

import '../tokens/app_colors.dart';
import '../tokens/app_spacing.dart';

/// A custom chip widget that displays a title and handles tap events.
///
/// The [ChipWidget] is a stylized button that displays a text label and
/// can respond to tap events with a custom callback function.
class ChipWidget extends StatelessWidget {
  /// The title to be displayed on the chip.
  final String title;

  /// The callback function to be called when the chip is tapped.
  final VoidCallback onTap;

  /// Creates a [ChipWidget].
  ///
  /// The [title] and [onTap] parameters are required.
  const ChipWidget({Key? key, required this.title, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(
            vertical: AppSpacing.small, horizontal: AppSpacing.medium),
        decoration: BoxDecoration(
          color: AppColors.primaryColorLight,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          StringUtils.capitalize(title),
          style: AppTextStyles.chip,
        ),
      ),
    );
  }
}
