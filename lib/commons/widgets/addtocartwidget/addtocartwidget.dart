import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:u1r/features/auth/controllers/cart_controller.dart/cart_controller.dart';

import 'package:u1r/features/shop/models/product_model.dart';

import '../../../helpers/helper_functions.dart';
import '../../../utils/constatnts/colors.dart';
import '../../../utils/constatnts/sizes.dart';
import '../circularIcon/Tcircularicons.dart';

class addtocartwidgetDetailScreen extends StatelessWidget {
  const addtocartwidgetDetailScreen({required this.product, super.key});

  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    final controller = cartController.instance;
    controller.updatealreadyaddedcount(product);
    final dark = THelperFunctions.isDarkMode(context);

    // here we will get the required Controller

    return Container(
      padding: const EdgeInsets.symmetric(
          horizontal: Tsizes.defaultspacing,
          vertical: Tsizes.defaultspacing / 2),
      decoration: BoxDecoration(
          color: dark ? Tcolors.darkgrey : Tcolors.light,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(Tsizes.cardRadiusLg),
              topRight: Radius.circular(Tsizes.cardRadiusLg))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Obx(() {
            return Row(
              children: [
                Tcircularicons(
                  backgroundColor: Color.fromARGB(255, 38, 35, 35),
                  width: 40,
                  height: 40,
                  color: Tcolors.white,
                  icon: Iconsax.minus,
                  onPressed: () {
                    controller.productQuantityincart.value < 1
                        ? null
                        : controller.productQuantityincart.value -= 1;
                  },
                ),
                const SizedBox(
                  width: Tsizes.spacebtwnitems,
                ),
                Text(
                  (controller.productQuantityincart.toString()),
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(
                  width: Tsizes.spacebtwnitems,
                ),
                Tcircularicons(
                  onPressed: () {
                    controller.productQuantityincart.value += 1;
                  },
                  backgroundColor: Tcolors.blck,
                  width: 40,
                  height: 40,
                  color: Tcolors.white,
                  icon: Iconsax.add,
                ),
                const SizedBox(
                  width: Tsizes.spacebtwnitems,
                ),
              ],
            );
          }),
          Obx(
            () => ElevatedButton(
                onPressed: () => controller.productQuantityincart.value < 1
                    ? null
                    : controller.additemtocart(product),
                    style: ElevatedButton.styleFrom(
                     padding: const EdgeInsets.all(Tsizes.md),
                       backgroundColor: controller.productQuantityincart.value < 1
                        ? Tcolors.grey
                        : Tcolors.dark,
                    side: BorderSide(color: Tcolors.blck)),
                child: Text("Add To Cart")),
          )
        ],
      ),
    );
  }
}
