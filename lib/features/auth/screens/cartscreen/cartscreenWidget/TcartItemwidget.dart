import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:u1r/features/auth/controllers/cart_controller.dart/cart_controller.dart';
import 'package:u1r/features/shop/models/cart_model/cart_model.dart';
import 'package:u1r/features/shop/productdetails/productdetails.dart';

import '../../../../../commons/widgets/bannerImages/TroundedbannerImages.dart';
import '../../../../../commons/widgets/circularIcon/Tcircularicons.dart';
import '../../../../../commons/widgets/product/roundedcontainer.dart';
import '../../../../../helpers/helper_functions.dart';
import '../../../../../utils/constatnts/colors.dart';
import '../../../../../utils/constatnts/sizes.dart';

class TcartItems extends StatelessWidget {
  const TcartItems(
      {super.key,
      required this.showaddremovebtns,
      required this.gesturedetectionfordetail});

  final bool showaddremovebtns;
  final bool gesturedetectionfordetail;
  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    final cartcontroller = cartController.instance;
    return ListView.separated(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: cartcontroller.cartItems.length,
        separatorBuilder: (_, __) => SizedBox(
              height: Tsizes.spacebtwnsection / 2,
              child: Container(),
            ),
        itemBuilder: (_, index) {
          return GestureDetector(
            onTap: gesturedetectionfordetail
                ? () => cartcontroller
                    .naviagatetoproduct(cartcontroller.cartItems[index])
                : null,
            child: TroundedConatiner(
              padding: const EdgeInsets.all(5),
              radius: 5,
              showBorder: true,
              child: Obx(
                () {
                  if (cartcontroller.cartItems.isNotEmpty) {
                    final isselectedgrade = cartcontroller
                            .cartItems[index].selectedgrade!['grade'] ==
                        '';
                    final isselectedweight = cartcontroller
                            .cartItems[index].selecteweight!['weight'] ==
                        '';

                    final cartItem = cartcontroller.cartItems[index];
                    return Column(
                      children: [
                        Row(
                          children: [
                            //Trounded Image

                            TroundedBannerImage(
                                isNetworkImage: true,
                                backgroundColor:
                                    THelperFunctions.isDarkMode(context)
                                        ? Tcolors.darkgrey
                                        : Tcolors.light,
                                width: 70,
                                height: 70,
                                padding: const EdgeInsets.all(Tsizes.sm),
                                imgurl: cartItem.thumbImage),

                            const SizedBox(
                              width: Tsizes.spacebtwnsection,
                            ),
                            //cp
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      cartItem.productName,
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium!
                                          .copyWith(
                                              color: dark
                                                  ? Tcolors.dark
                                                  : Tcolors.blck,
                                              fontSize: 15,
                                              fontWeight: FontWeight.w600),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "Weight : ",
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium!
                                          .copyWith(
                                              color: dark
                                                  ? Tcolors.dark
                                                  : Tcolors.blck,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500),
                                    ),
                                    Text(
                                        isselectedweight
                                            ? '${cartItem.productweight} Kg'
                                            : "${cartItem.selecteweight!['weight']} kg ",
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleMedium!
                                            .copyWith(
                                                color: dark
                                                    ? Tcolors.dark
                                                    : Tcolors.blck,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500)),
                                  ],
                                ),

                                //If there is  grade then show else don't
                                isselectedgrade
                                    ? Container()
                                    : Row(
                                        children: [
                                          Text(
                                            "Grade : ",
                                            style: TextStyle(
                                              color: dark
                                                  ? Tcolors.dark
                                                  : Tcolors.blck,
                                            ),
                                          ),
                                          Text(
                                            cartItem.selectedgrade!['grade'],
                                            overflow: TextOverflow.ellipsis,
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleMedium!
                                                .copyWith(
                                                    color: dark
                                                        ? Tcolors.dark
                                                        : Tcolors.blck,
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.w600),
                                          ),
                                        ],
                                      ),
                                Row(
                                  children: [
                                    Text(
                                      "Price : ",
                                      style: TextStyle(
                                        color:
                                            dark ? Tcolors.dark : Tcolors.blck,
                                      ),
                                    ),
                                    Icon(
                                      const IconData(
                                        0xf05db,
                                        fontFamily: 'MaterialIcons',
                                      ),
                                      color: dark ? Tcolors.dark : Tcolors.blck,
                                      size: 14,
                                    ),
                                    Text.rich(TextSpan(
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleMedium!
                                            .copyWith(
                                                color: dark
                                                    ? Tcolors.dark
                                                    : Tcolors.blck,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500),
                                        children: [
                                          TextSpan(
                                              text:
                                                  "${cartItem.productprice} x${cartItem.productQuantity} =${double.parse(cartItem.productprice) * cartItem.productQuantity}"),
                                        ])),
                                  ],
                                ),
                              ],
                            )
                          ],
                        ),
                        const SizedBox(
                          height: Tsizes.spacebtwnitems / 2,
                        ),

                        //show add remove btn is selected we will show options to increase the quantity
                        //for the product based on the Screen

                        showaddremovebtns
                            ? Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  TroundedConatiner(
                                      radius: Tsizes.sm / 4,
                                      backgroundColor:
                                          Tcolors.primaryColor.withOpacity(0.4),
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: Tsizes.sm,
                                          vertical: Tsizes.xs),
                                      child: Text(
                                        "You Saved 25%",
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelSmall!
                                            .apply(color: Tcolors.blck),
                                      )),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          cartcontroller
                                              .removeOneitemtocart(cartItem);

                                          //   cartcontroller.removeFromCart(product)
                                        },
                                        child: const Tcircularicons(
                                          radius: 1,
                                          backgroundColor:
                                              Tcolors.primaryColorbtnshade,
                                          width: 50,
                                          height: 30,
                                          color: Tcolors.white,
                                          icon: Iconsax.minus,
                                        ),
                                      ),
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10, vertical: 2),
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Tcolors
                                                    .primaryColorbtnshade)),
                                        child: Text(
                                          cartItem.productQuantity.toString(),
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleMedium!
                                              .copyWith(
                                                color: dark
                                                    ? Tcolors.dark
                                                    : Tcolors.blck,
                                              ),
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          cartcontroller
                                              .addOneitemtocart(cartItem);
                                        },
                                        child: const Tcircularicons(
                                          radius: 1,
                                          backgroundColor:
                                              Tcolors.primaryColorbtnshade,
                                          width: 50,
                                          height: 30,
                                          color: Tcolors.white,
                                          icon: Iconsax.add,
                                        ),
                                      ),
                                      const SizedBox(
                                        width: Tsizes.spacebtwnitems,
                                      ),
                                    ],
                                  ),
                                ],
                              )
                            : Container(),
                      ],
                    );
                  } else {
                    return Container();
                  }
                },
              ),
            ),
          );
        });
  }
}
