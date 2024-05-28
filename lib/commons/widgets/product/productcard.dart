import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:u1r/commons/styles/shadow.dart';
import 'package:u1r/commons/widgets/product/add_tocart_btn_grid.dart';
import 'package:u1r/commons/widgets/product/favrouites_icon.dart';
import 'package:u1r/commons/widgets/product/roundedcontainer.dart';
import 'package:u1r/features/shop/models/product_model.dart';
import 'package:u1r/features/shop/productdetails/productdetails.dart';
import 'package:u1r/helpers/helper_functions.dart';

import 'package:u1r/utils/constatnts/colors.dart';
import 'package:u1r/utils/constatnts/sizes.dart';

import '../bannerImages/TroundedbannerImages.dart';

class Tproductverticalcards extends StatelessWidget {
  const Tproductverticalcards({super.key, required this.product});

  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: () {
        //function will be here to navigate to the product details Page

        Get.to(
            transition: Transition.noTransition,
            () => Productdetailcreen(product: product));
      },
      child: Container(
        width: 190,
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
            boxShadow: [TshadowStyle.horizontalShadowbox],
            borderRadius: BorderRadius.circular(Tsizes.divproductImageRadius),
            color: THelperFunctions.isDarkMode(context)
                ? Tcolors.darkgrey
                : Tcolors.white),
        child: Column(
          children: [
            //thumbnail container ,wish list Button , Discount Tag

            TroundedConatiner(
              height: 180,
              padding: EdgeInsets.zero,
              backgroundColor: dark ? Tcolors.dark : Tcolors.light,
              child: Stack(
                fit: StackFit.passthrough,
                children: [
                  //thumbnailImage
                  TroundedBannerImage(
                    isNetworkImage: true,
                    width: 180,
                    imgurl: product.photoUrl,
                    applyImageradius: true,
                  ),

                  //off Tag for the prodcuts
                  Positioned(
                    top: 8,
                    child: TroundedConatiner(
                      radius: Tsizes.sm,
                      backgroundColor: Tcolors.secondary.withOpacity(0.8),
                      padding: const EdgeInsets.symmetric(
                          horizontal: Tsizes.sm, vertical: Tsizes.xs),
                      child: Text(
                        '25%',
                        style: Theme.of(context)
                            .textTheme
                            .labelLarge!
                            .apply(color: Tcolors.blck),
                      ),
                    ),
                  ),
                  //Fouverite Icon button

                  Positioned(
                    top: 0,
                    right: 0,
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: THelperFunctions.isDarkMode(context)
                              ? Tcolors.darkgrey.withOpacity(.9)
                              : Tcolors.white.withOpacity(0.9)),
                      child: Tfavourites(
                        productID: product.productId,
                      ),
                    ),
                  )
                ],
              ),
            ),

            const SizedBox(
              height: Tsizes.spacebtwnitems / 2,
            ),

            /// Product Details
            Padding(
              padding: const EdgeInsets.only(left: Tsizes.sm),
              child: Column(
                children: [
                  Text(
                    product.productname,
                    style: Theme.of(context).textTheme.titleSmall,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    textAlign: TextAlign.left,
                  ),
                ],
              ),
            ),

            //Add Here spacer
            //Addding the Spacer to keep the size of the container same in all cases

            const Spacer(),
            const SizedBox(
              height: Tsizes.spacebtwnitems / 2,
            ),
            Text(
              product.variations,
              style: Theme.of(context).textTheme.labelMedium,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              textAlign: TextAlign.left,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Icon(
                      IconData(0xf05db, fontFamily: 'MaterialIcons'),
                      size: 15,
                    ),
                    Text.rich(TextSpan(children: [
                      TextSpan(
                        text: (product.productPrice).toString(),
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      TextSpan(
                        text: "/kg",
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                    ])),
                    //price and Button
                  ],
                ),
                addtocartbtnongrid(product: product,),
              ],
            )
          ],
        ),
      ),
    );
  }
}