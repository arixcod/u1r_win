import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:u1r/commons/widgets/custom_appbar/custom_apbbar.dart';
import 'package:u1r/commons/widgets/customsearchbar/searchbar.dart';
import 'package:u1r/commons/widgets/layouts/gridlayouts.dart';
import 'package:u1r/commons/widgets/shimmer/Tverticleproductshimmer.dart';
import 'package:u1r/features/shop/controllers/subcategorywise_product/subcwiseproduct_controller.dart';
import 'package:u1r/helpers/helper_functions.dart';
import 'package:u1r/utils/constatnts/colors.dart';
import 'package:u1r/utils/constatnts/sizes.dart';

import '../../../../commons/widgets/product/roundedcontainer.dart';
import '../../../../commons/widgets/shimmer/categoryshimmer.dart';
import '../../../../commons/widgets/shimmer/shimmer.dart';
import '../../../commons/widgets/product/productcard.dart';
import '../controllers/categoryController.dart';

class detailed_page_allproduct extends StatelessWidget {
  detailed_page_allproduct(
      {super.key, required this.screentitle, required this.subCateggoryID});
  final String screentitle;
  final String subCateggoryID;

  @override
  Widget build(BuildContext context) {
    final categorycontroller =
        Get.put(subcategorywiseController(subcategryId: subCateggoryID));
        final controller = subcategorywiseController.instance;

    return Scaffold(
      appBar: TcustomAppbar(
        hieght: 70,
        showBackArrow: true,
        tittle: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              "U1r",
              style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                  color: Tcolors.white,
                  fontSize: 40,
                  fontWeight: FontWeight.w800),
            ),
            SizedBox(
              width: 15,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                    screentitle.substring(0, 1) +
                        screentitle.substring(1, screentitle.length),
                    style: Theme.of(context)
                        .textTheme
                        .headlineMedium!
                        .copyWith(color: Tcolors.dark, fontSize: 16)),
                    Obx(
                      (){
                        if(categorycontroller.allproducts.isEmpty) return Container(height: 15,);
                                          
                        return Text('${controller.allproducts.length} products',
                        style: Theme.of(context)
                          .textTheme
                          .headlineMedium!
                          .copyWith(color: Tcolors.dark, fontSize: 10))
             ;
                      }      )
              ],
            )
          ],
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.canPop(context);
              },
              icon: const Icon(
                Iconsax.document_filter,
                color: Tcolors.white,
                size: 20,
              ))
        ],
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(
            height: Tsizes.spacebtwnitems,
          ),
          searchwidget(),
          const SizedBox(
            height: Tsizes.spacebtwnitems * 2,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Obx(
                () {
                        
                  if (controller.isLoading.value) {
                     return Tverticalproductshimmer(
                        itemcount: 10,
                    );
                  }
                  else {
                    return Tgridlayout(
                        itemCount: controller.allproducts.length,
                        itemBuilder: (_, index) {
                          return Tproductverticalcards(
                            product: controller.allproducts[index],
                          );
                        });
                  } 
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
