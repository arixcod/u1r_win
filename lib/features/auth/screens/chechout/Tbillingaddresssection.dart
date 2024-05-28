import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:u1r/features/shop/address/adress._controller.dart';

import '../../../../utils/constatnts/sizes.dart';

class billingadress extends StatelessWidget {
  const billingadress({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = AddresController.instance;
    return Column(
      children: [
        Obx(() {
          final adress = controller.selectedAddress.value.adresss;
           if (adress.isEmpty) {
            return Text('Select Delivery Adress');
          } else {
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // I Will Have to Store the Names too for fetching the Adress
                Text("Anand Mishra",
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(fontWeight: FontWeight.w500, fontSize: 14)),
                const SizedBox(
                  height: Tsizes.spacebtwnitems / 3,
                ),
                Row(
                  children: [
                    Icon(
                      Iconsax.call,
                      size: 15,
                    ),
                    Text(controller.selectedAddress.value.MobileNo,
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontWeight: FontWeight.w500, fontSize: 14)),
                  ],
                ),
                const SizedBox(
                  height: Tsizes.spacebtwnitems / 3,
                ),
                Obx(
                  () => Row(
                    children: [
                      Icon(
                        Iconsax.location,
                        size: 15,
                      ),
                      const SizedBox(
                        width: Tsizes.spacebtwnitems / 3,
                      ),
                      Expanded(
                        child: Text(
                            controller.selectedAddress.value.adresss +
                                ' ,' +
                                controller.selectedAddress.value.city +
                                ' ,' +
                                controller.selectedAddress.value.pinocde +
                                ' ,' +
                                controller.selectedAddress.value.State,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 3,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                    fontWeight: FontWeight.w500, fontSize: 14)),
                      ),
                    ],
                  ),
                ),
              ],
            );
          }
        })
      ],
    );
  }
}
