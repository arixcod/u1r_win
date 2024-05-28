import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:u1r/commons/widgets/custom_appbar/custom_apbbar.dart';
import 'package:u1r/commons/widgets/product/roundedcontainer.dart';
import 'package:u1r/features/auth/screens/myorderscreen/Torderlistitem.dart';

import '../../../../helpers/helper_functions.dart';
import '../../../../utils/constatnts/colors.dart';
import '../../../../utils/constatnts/sizes.dart';

class MyOrdersScreen extends StatelessWidget {
  const MyOrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TcustomAppbar(
        showBackArrow: true,
        tittle: Text(
          'My Orders',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        actions: const [
          Icon(
            Iconsax.receipt,
            color: Tcolors.primaryColor,
          )
        ],
      ),
      body: Padding(
          padding: const EdgeInsets.all(Tsizes.defaultspacing),
          child: TroundedConatiner(
            showBorder: true,
            backgroundColor: THelperFunctions.isDarkMode(context)
                ? Tcolors.dark
                : Tcolors.light,
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: orderWidget(),
            ),
          )),
    );
  }
}

