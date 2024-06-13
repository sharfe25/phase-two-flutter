import 'package:flutter/material.dart';
import 'package:phase_two_flutter/components/atoms/skeletons/skeleton_widget.dart';

import '../../tokens/app_spacing.dart';

class CategoriesSkeleton extends StatelessWidget {
  const CategoriesSkeleton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(top: AppSpacing.small),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SkeletonWidget(height: 35, width: 80),
          SizedBox(
            width: AppSpacing.medium,
          ),
          SkeletonWidget(height: 35, width: 80),
        ],
      ),
    );
  }
}
