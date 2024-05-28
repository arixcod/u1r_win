import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:u1r/commons/widgets/loaders/animation_loader.dart';
import 'package:u1r/commons/widgets/product/roundedcontainer.dart';
import 'package:u1r/features/auth/controllers/ordercontroller.dart';
import 'package:u1r/helpers/cloud_helper_functions.dart';
import 'package:u1r/helpers/helper_functions.dart';
import 'package:u1r/navigation_menu.dart';
import 'package:u1r/utils/constatnts/Image_strings.dart';

import '../../../../utils/constatnts/colors.dart';
import '../../../../utils/constatnts/sizes.dart';

class orderWidget extends StatelessWidget {
  const orderWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OrderController());
    final dark = THelperFunctions.isDarkMode(context);

    return FutureBuilder(
        future: controller.fetchuserorder(),
        builder: (context, snapshot) {
          //Order is placed then show

          final emptyWidget = TAnimationLoaderWidget(
            text: "No Orders yet",
            animation: TImages.deliveredinEmailillustration,
            showAction: true,
            actionText: 'Shop',
            onActionPressed: () => Get.offAll(() => NavigationMenu()),
          );
          //check
          //
          //
          final response =
              TCloudHelperFunctions.checkMultiRecordState(snapshot: snapshot);
          if (response != null) return response;

          final orders = snapshot.data!;
          return ListView.separated(
              itemCount: orders.length,
              separatorBuilder: (context, index) {
                return const SizedBox(
                  height: 10,
                );
              },
              shrinkWrap: true,
              itemBuilder: (_, index) {
                final order = orders[index];
                return TroundedConatiner(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(Iconsax.ship,
                              color: dark ? Tcolors.dark : Tcolors.blck),
                          const SizedBox(
                            width: Tsizes.spacebtwnitems,
                          ),
                          Column(
                            children: [
                              Text(
                                order.OrderStatustext,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .apply(
                                        color: Tcolors.primaryColor,
                                        fontWeightDelta: 1),
                              ),
                              Text(
                                order.fromatedOrderdate,
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineSmall!
                                    .apply(
                                        color:
                                            dark ? Tcolors.dark : Tcolors.blck),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                'Processing',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .apply(
                                        color: Tcolors.primaryColor,
                                        fontWeightDelta: 1),
                              ),
                              Text(
                                order.fromatedOrderDeliverydate,
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineSmall!
                                    .apply(
                                        color:
                                            dark ? Tcolors.dark : Tcolors.blck),
                              ),
                            ],
                          ),
                          Icon(Iconsax.arrow_down5,
                              color: dark ? Colors.black : Tcolors.blck)
                        ],
                      ),
                      SizedBox(
                        height: Tsizes.spacebtwnitems,
                      ),
                      Row(
                        children: [
                          Icon(Iconsax.tag,
                              color: dark ? Tcolors.dark : Tcolors.blck),
                          SizedBox(
                            width: Tsizes.spacebtwnitems,
                          ),
                          Column(
                            children: [
                              Text(
                                'Order Id',
                                style: Theme.of(context)
                                    .textTheme
                                    .labelMedium!
                                    .apply(fontWeightDelta: 1),
                              ),
                              Text(
                                order.id,
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineSmall!
                                    .apply(
                                        color:
                                            dark ? Tcolors.dark : Tcolors.blck),
                              ),
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                );
              });
        });
  }
}
