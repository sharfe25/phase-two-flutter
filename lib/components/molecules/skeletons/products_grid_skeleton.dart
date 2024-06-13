import 'package:flutter/material.dart';

import '../../atoms/skeletons/skeleton_widget.dart';
import '../../tokens/app_spacing.dart';

class ProductsGridSkeleton extends StatelessWidget {
const ProductsGridSkeleton({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return GridView.builder(
      shrinkWrap: true,
      padding: const EdgeInsets.symmetric(vertical: AppSpacing.small),
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 4,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 20.0,
        crossAxisSpacing: 12.0,
        childAspectRatio: 1 / 1.5,
      ),
      itemBuilder: (context, index) {
        return const SkeletonWidget(
          width: 200,
          height: 210,
        );
      },
    );
  }
}