import 'package:flutter/material.dart';
import 'package:u1r/features/auth/controllers/cart_controller.dart/cart_controller.dart';
import 'package:u1r/features/auth/controllers/checkoutcontrollers.dart';

import '../../../../utils/constatnts/sizes.dart';

class billingSections extends StatelessWidget {
  const billingSections({super.key});

  @override
  Widget build(BuildContext context) {
    final cartcontroller=cartController.instance;
    final subtotal=cartcontroller.totalCartPrice.value;
    final checkoutcontroller=CheckoutController.instance;    
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Subtotal", style: Theme.of(context).textTheme.bodyMedium),
            Row(
              children: [
                const Icon(
                  IconData(0xf05db, fontFamily: 'MaterialIcons'),
                  size: 14,
                ),
                Text.rich(TextSpan(
                    style: Theme.of(context).textTheme.bodyMedium,
                    children:  [
                      TextSpan(text: subtotal.toString()),
                    ])),
              ],
            ),
          ],
        ),
        const SizedBox(
          height: Tsizes.spacebtwnitems / 2,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Tax", style: Theme.of(context).textTheme.bodyMedium),
            Row(
              children: [
                
                Text.rich(TextSpan(
                    style: Theme.of(context).textTheme.labelSmall,
                    children: const [
                      TextSpan(text: "Inlcusive"),
                    ])),
              ],
            ),
          ],
        ),
        const SizedBox(
          height: Tsizes.spacebtwnitems / 2,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Shipping", style: Theme.of(context).textTheme.bodyMedium),
            Row(
              children: [
                const Icon(
                  IconData(0xf05db, fontFamily: 'MaterialIcons'),
                  size: 12,
                ),
                Text.rich(TextSpan(
                    style: Theme.of(context).textTheme.labelMedium,
                    children: const [
                      TextSpan(text: "\660"),
                    ])),
              ],
            ),
          ],
        ),
        const SizedBox(
          height: Tsizes.spacebtwnitems / 2,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Order Total", style: Theme.of(context).textTheme.bodyMedium),
            Row(
              children: [
                const Icon(
                  IconData(0xf05db, fontFamily: 'MaterialIcons'),
                  size: 14,
                ),
                Text.rich(TextSpan(
                    style: Theme.of(context).textTheme.bodyMedium,
                    children:  [
                      TextSpan(text: "${checkoutcontroller.totalcost_to_customer.value}"),
                    ])),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
