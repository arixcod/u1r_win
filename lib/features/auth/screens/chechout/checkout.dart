import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:u1r/commons/widgets/product/roundedcontainer.dart';
import 'package:u1r/features/auth/controllers/cart_controller.dart/cart_controller.dart';
import 'package:u1r/features/auth/controllers/checkoutcontrollers.dart';
import 'package:u1r/features/auth/controllers/ordercontroller.dart';
import 'package:u1r/features/auth/screens/cartscreen/cartscreenWidget/TcartItemwidget.dart';
import 'package:u1r/features/auth/screens/chechout/Tbillingaddresssection.dart';
import 'package:u1r/features/auth/screens/chechout/billingsection.dart';
import 'package:u1r/features/shop/address/adress._controller.dart';
import 'package:u1r/helpers/helper_functions.dart';
import 'package:u1r/utils/constatnts/colors.dart';

import '../../../../commons/widgets/custom_appbar/custom_apbbar.dart';
import '../../../../commons/widgets/product/tcoupouncart.dart';
import '../../../../utils/constatnts/sizes.dart';

class CheckoutScree extends StatelessWidget {
  const CheckoutScree({super.key});

  @override
  Widget build(BuildContext context) {
    final adresscontroller = AddresController.instance;
    final cartcontroller = cartController.instance;
    //Here is the controller for the orders
    final controller = Get.put(CheckoutController(
      shpping_cost:600.0,
      tax: 0.0,
      subtotal: cartcontroller.totalCartPrice.value
    ));
    final ordercontroller = Get.put(OrderController());
    
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(Tsizes.md),
        child: SizedBox(
            width: double.infinity,
            child: ElevatedButton(
                style: const ButtonStyle(
                    side: MaterialStatePropertyAll(BorderSide.none),
                    backgroundColor:
                        MaterialStatePropertyAll(Tcolors.primaryColorbtnshade)),
                onPressed: () {
                  // Order review Page for the checkout

                  ordercontroller.processorder(cartcontroller.totalCartPrice.value);
                },
                child: Text(
                  'Proceed To Buy ',
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      fontWeight: FontWeight.w500, color: Tcolors.white),
                ))),
      ),
      appBar: TcustomAppbar(
        showBackArrow: true,
        tittle: Text(
          'Order Review',
          style: Theme.of(context)
              .textTheme
              .headlineSmall!
              .copyWith(color: Tcolors.white),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Icon(
              Iconsax.receipt,
              color: Tcolors.white,
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(Tsizes.defaultspacing),
          child: Column(
            children: [
              //items in the cart

              TcartItems(
                gesturedetectionfordetail: false,
                showaddremovebtns: false,
              ),

              const SizedBox(
                height: Tsizes.spacebtwnitems,
              ),
              tcoupouncart(), //input Textfield
              const SizedBox(
                height: Tsizes.spacebtwnitems,
              ),

              //Billing sections

              TroundedConatiner(
                showBorder: true,
                backgroundColor: THelperFunctions.isDarkMode(context)
                    ? Tcolors.blck
                    : Tcolors.white,
                child: Padding(
                  padding: const EdgeInsets.all(Tsizes.md),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //Billing Section
                      billingSections(),

                      const SizedBox(
                        height: Tsizes.spacebtwnitems / 2,
                      ),
                      const Divider(),

                      //Billing Sections here
                      const SizedBox(
                        height: Tsizes.spacebtwnitems / 2,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Payment Method',
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                          TextButton(
                              onPressed: () {
                                //
                                controller.selectpyamnetmethod(context);
                              },
                              child: Text('Change'))
                        ],
                      ),

                      Obx(
                        () => Row(
                          children: [
                            TroundedConatiner(
                              width: 60,
                              height: 35,
                              backgroundColor:
                                  THelperFunctions.isDarkMode(context)
                                      ? Tcolors.light
                                      : Tcolors.white,
                              padding: const EdgeInsets.all(Tsizes.sm),
                              child: Image(
                                  image: AssetImage(
                                      controller.selectedpayemnt.value.image)),
                            ),
                            SizedBox(width: 20,),
                            Text(controller.selectedpayemnt.value.name,style: Theme.of(context).textTheme.titleMedium!.copyWith(
                              fontStyle: FontStyle.italic
                            ),)
                          ],
                        ),
                      ),

                      const SizedBox(
                        height: Tsizes.spacebtwnitems,
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Shipping Address',
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                          TextButton(
                              onPressed: () {
                                adresscontroller.selectNewAdresspopup(context);
                              },
                              child: Text('Change'))
                        ],
                      ),

                      const SizedBox(
                        height: Tsizes.spacebtwnitems,
                      ),

                      //Adress Selection for the User

                      billingadress()
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
