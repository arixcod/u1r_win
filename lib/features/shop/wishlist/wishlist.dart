import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:u1r/commons/widgets/custom_appbar/custom_apbbar.dart';
import 'package:u1r/commons/widgets/layouts/gridlayouts.dart';
import 'package:u1r/commons/widgets/shimmer/Tverticleproductshimmer.dart';
import 'package:u1r/features/shop/controllers/favourites_controller.dart';
import 'package:u1r/helpers/cloud_helper_functions.dart';
import 'package:u1r/utils/constatnts/sizes.dart';

import '../../../commons/widgets/product/productcard.dart';
import '../../../utils/constatnts/colors.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});
  @override
  Widget build(BuildContext context) {

  final controller=FavouritesController.instance;
    return Scaffold(
      appBar: TcustomAppbar(
        tittle: Text(
          'Wishlist',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        actions: [
          Icon(
            Iconsax.heart5,
            color: Tcolors.primaryColor,
            size: 30,
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(Tsizes.defaultspacing),
          child: Column(
            children: [
          
               Obx(
                 ()=> FutureBuilder(
                   future: controller.favouriteProduct(),
                   builder: (context, snapshot) {
                     
                     const loader=Tverticalproductshimmer(itemcount: 6,);
                     final widget=TCloudHelperFunctions.checkMultiRecordState(snapshot: snapshot,loader: loader);
                     if(widget!=null) return widget;
                      final product=snapshot.data!;
                     return Tgridlayout(
                          itemCount: product.length,
                          itemBuilder: (_, index) => Tproductverticalcards(product: product[index]));
                   }
                 ),
               ),
              
            ],
          ),
        ),
      ),
    );
  }
}
