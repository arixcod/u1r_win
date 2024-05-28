import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:u1r/commons/widgets/custom_appbar/custom_apbbar.dart';
import 'package:u1r/commons/widgets/loaders/animation_loader.dart';
import 'package:u1r/features/auth/controllers/cart_controller.dart/cart_controller.dart';
import 'package:u1r/features/auth/screens/chechout/checkout.dart';
import 'package:u1r/features/shop/address/adress._controller.dart';
import 'package:u1r/helpers/helper_functions.dart';
import 'package:u1r/navigation_menu.dart';
import 'package:u1r/utils/constatnts/Image_strings.dart';
import '../../../../commons/widgets/product/roundedcontainer.dart';
import '../../../../utils/constatnts/colors.dart';
import '../../../../utils/constatnts/sizes.dart';
import 'cartscreenWidget/TcartItemwidget.dart';

class Cartscreen extends StatelessWidget {
  const Cartscreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = cartController.instance;
    final adresscontroller = AddresController.instance;
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: TcustomAppbar(
        tittle: Text(
          'Cart',
          style: Theme.of(context)
              .textTheme
              .headlineMedium!
              .copyWith(color: Tcolors.white),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Icon(
              Iconsax.shopping_bag,
              color: Tcolors.white,
            ),
          )
        ],
      ),
      body: Obx(() {
        final cartItems = controller.cartItems;

        if (cartItems.isEmpty) {
          return TAnimationLoaderWidget(
            text: "Looks Like Your Shopping Cart Is Empty",
            animation: TImages.EmptycartAnimation,
            showAction: true,
            actionText: 'Lets Shop',
            onActionPressed: () {
              Get.off(() => NavigationMenu());
            },
          );
        } else {
          return Column(
            children: [
              // final cartItems=controller.cartItems;
              Container(
                color: Tcolors.grey.withOpacity(0.4),
                padding: const EdgeInsets.all(12),
                child: SizedBox(
                  width: double.infinity,
                  child: TroundedConatiner(
                    showBorder: true,
                    padding: const EdgeInsets.symmetric(
                        horizontal: Tsizes.defaultspacing / 2,
                        vertical: Tsizes.defaultspacing / 1.5),
                    child: Wrap(
                      direction: Axis.horizontal,
                      crossAxisAlignment: WrapCrossAlignment.start,
                      children: [
                        SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                                style: const ButtonStyle(
                                    side: MaterialStatePropertyAll(
                                        BorderSide.none),
                                    backgroundColor: MaterialStatePropertyAll(
                                        Tcolors.primaryColorbtnshade)),
                                onPressed: () {
                                  // Order review Page for the checkout
                                  Get.to(() => const CheckoutScree(),
                                    transition: Transition.rightToLeftWithFade,
                                  duration: Duration(
                                    microseconds: 1000
                                  )
                                  
                                  );
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Checkout   ',
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium!
                                          .copyWith(
                                              fontSize: 18,
                                              color: Tcolors.white),
                                    ),
                                    const Icon(
                                      IconData(0xf05db,
                                          fontFamily: 'MaterialIcons'),
                                      size: 14,
                                    ),
                                    Text(
                                      ' ${controller.totalCartPrice.value}',
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium!
                                          .copyWith(
                                              fontSize: 18,
                                              color: Tcolors.white),
                                    ),
                                  ],
                                ))),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 18, bottom: 10, left: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(" Item Quantity : ${controller.noCartItems}",
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleSmall!
                                      .copyWith(
                                          color: dark
                                              ? Tcolors.dark
                                              : Tcolors.dark,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                          fontStyle: FontStyle.italic)),
                              Row(
                                children: [
                                  Text(
                                    "Price :  ",
                                    style: TextStyle(
                                      color: dark ? Tcolors.dark : Tcolors.dark,
                                    ),
                                  ),
                                  Icon(
                                 const IconData(0xf05db,
                                        fontFamily: 'MaterialIcons'),
                                    size: 14,
                                    color: dark ? Tcolors.dark : Tcolors.dark,
                                  ),
                                  Text(
                                    "${controller.totalCartPrice}",
                                    style: TextStyle(
                                      color: dark ? Tcolors.dark : Tcolors.dark,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text("Delivery Adress : ",
                            style: Theme.of(context)
                                .textTheme
                                .labelMedium!
                                .copyWith(
                                    color: dark ? Tcolors.dark : Tcolors.dark,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    fontStyle: FontStyle.italic)),
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Text(
                              '${adresscontroller.selectedAddress.value.adresss},${adresscontroller.selectedAddress.value.pinocde},${adresscontroller.selectedAddress.value.city},${adresscontroller.selectedAddress.value.State}',
                              softWrap: true,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context)
                                  .textTheme
                                  .labelLarge!
                                  .copyWith(fontSize: 13)),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    color: Tcolors.grey.withOpacity(0.4),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: Tsizes.defaultspacing / 2,
                          vertical: Tsizes.defaultspacing),
                      child: Column(
                        children: [
                          TcartItems(
                            gesturedetectionfordetail: true,
                            showaddremovebtns: true,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        }
      }),
    );
  }
}
