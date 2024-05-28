import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:iconsax/iconsax.dart';
import 'package:u1r/commons/widgets/layouts/gridlayouts.dart';
import 'package:u1r/commons/widgets/product/productcard.dart';
import 'package:u1r/features/shop/controllers/allproductController.dart';
import 'package:u1r/features/shop/models/product_model.dart';

import '../../../../utils/constatnts/sizes.dart';

class TsoratbleProducts extends StatelessWidget {
  const TsoratbleProducts({super.key, required this.products});

  final List<ProductModel>products;

  @override
  Widget build(BuildContext context) {
    final controller=Get.put(AllProductController());
    controller.assignProducts(products);
    return Column(
      children: [
        //dropdown 
        

 DropdownButtonFormField(
              
              value: controller.selectedSortableOption.value,
             decoration: const InputDecoration(prefixIcon:Icon(Iconsax.sort) ), 
            items: [
        
                'Name',
                'Higher Price',
                'Lower Price',
                'Sale',
                'Newest'
              ].map((options) => DropdownMenuItem(child: Text(options),value: options,)).toList(), 
                onChanged: (value){
                controller.SortProducts(value!);

            })
        
         
      ,
      const SizedBox(height: Tsizes.spacebtwInputField,),
      //products
      Obx(
        (){
          return Tgridlayout(itemCount: controller.products.length, itemBuilder: (_,index){
          return Tproductverticalcards(product: controller.products[index]);
        });
        } 
      )
      ],
    );
  }
}