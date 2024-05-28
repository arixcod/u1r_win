import 'package:flutter/material.dart';
import 'package:u1r/commons/widgets/layouts/gridlayouts.dart';
import 'package:u1r/commons/widgets/shimmer/shimmer.dart';

import '../../../utils/constatnts/sizes.dart';

class Tverticalproductshimmer extends StatelessWidget {
  const Tverticalproductshimmer({super.key,  this.itemcount=4});
  final int itemcount;
  @override
  Widget build(BuildContext context) {
    return Tgridlayout(
        itemCount: itemcount,
        itemBuilder: (_, __) {
          return const SizedBox(
            width: 180,
            child: Column(
              children: [
                // shimmer for the Image
                TShimmerWidget(width: 180, height: 180),
                SizedBox(height: Tsizes.spacebtwnitems),
               
                TShimmerWidget(width: 180, height: 15),
                SizedBox(height: Tsizes.spacebtwnitems/2),
                TShimmerWidget(width: 180, height: 15),
              
              ],
            ),
          );
        });
  }
}
