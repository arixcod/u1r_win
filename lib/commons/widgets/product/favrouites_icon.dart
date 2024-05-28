import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:u1r/features/shop/controllers/favourites_controller.dart';

class Tfavourites extends StatelessWidget {
  const Tfavourites({
    required this.productID,
    super.key});
  final String productID;
  @override
  Widget build(BuildContext context) {
    final controller=Get.put(FavouritesController());

      return Obx(()=>
     IconButton(  
            color:controller.istFavourites(productID)?Colors.red:null ,
            icon:controller.istFavourites(productID)? const Icon(Iconsax.heart5):const Icon(Iconsax.heart) ,onPressed: () {
                          
                  controller.togglefavoritesproducts(productID);

                        },),
    ) ;}
}