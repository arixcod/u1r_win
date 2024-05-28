import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:u1r/utils/constatnts/sizes.dart';

import '../../../../utils/constatnts/colors.dart';
class profileediatbalewidget extends StatelessWidget {
  const profileediatbalewidget({
    super.key, required this.title, required this.value, required this.onpressed,
  });

  final String title,value;
  final VoidCallback onpressed;
  

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onpressed,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: Tsizes.spacebtwnitems/2),
        child: Row(
          children: [
            Expanded(
              flex: 3,
              child: Text(
                title,
                style: Theme.of(context)
                    .textTheme
                    .labelMedium!
                    .copyWith(
                        fontWeight: FontWeight.w600,
                        color: Tcolors.darkergrey),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Expanded(flex: 5,
              child: Text(
                value,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(
                        fontWeight: FontWeight.w600,
                        color: Tcolors.blck),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          const  Expanded(child: Icon(Iconsax.arrow_right_34))
          ],
        ),
      ),
    );
  }
}
