import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:u1r/commons/widgets/product/roundedcontainer.dart';
import 'package:u1r/features/shop/controllers/productcontrollers/productimagecontroller.dart';
import 'package:u1r/features/shop/models/product_model.dart';

import '../../../helpers/helper_functions.dart';
import '../../../utils/constatnts/colors.dart';
import '../../../utils/constatnts/sizes.dart';
import '../bannerImages/TroundedbannerImages.dart';
import '../custom shapes/customshapes/customshape.dart';
import '../custom_appbar/custom_apbbar.dart';

class TproductImageslider extends StatelessWidget {
  const TproductImageslider({
    super.key,
    required this.product,
  });

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    final controller = Get.put(ImageController());
    final images = controller.getAllProductImages(product);

    return custom_shape_cruved(
      child: Container(
        color: dark ? Tcolors.darkgrey : Tcolors.light,
        child: Stack(
          children: [
            //Main Product Hero or Large Image
            SizedBox(
                height: 350,
                child: Padding(
                  padding:
                      const EdgeInsets.all(Tsizes.divproductImageRadius * 2),
                    child: Center(
                      child: Obx(() {
                        final image = controller.selectedProductImage.value;
                          return GestureDetector(
                             onTap: () {
                                 controller.zoomImages(image);
                                 },
                               child: TroundedConatiner(
                              width: double.infinity,
                            showBorder: true,
                            child: CachedNetworkImage(
                            fit: BoxFit.cover,
                             height: 280,
                             width: double.infinity,
                               progressIndicatorBuilder: (_, __, downloadProgress) {
                              return Center(
                                child: CircularProgressIndicator(
                                  value: downloadProgress.progress,
                                  color: Tcolors.primaryColor,
                                ),
                              );
                            },
                            imageUrl: image),
                      ),
                    );
                  })),
                )),

            // Image Slider small Images

            Positioned(
              bottom: 25,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: 80,
                  child: ListView.separated(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    physics: const AlwaysScrollableScrollPhysics(),
                    itemCount: images.length,
                    separatorBuilder: (context, index) => const SizedBox(
                      width: Tsizes.spacebtwnitems,
                    ),
                       itemBuilder: (_, index) {
                          return Obx(() {
                             final imageselected =controller.selectedProductImage.value ==images[index];
                              return TroundedBannerImage(      
                              onPressed: () {

                                controller.selectedProductImage.value = images[index];
                              } ,
                              isNetworkImage: true,
                              width: 80,
                              borderRadius: 5,
                              applyImageradius: true,
                               boxBorder: Border.all(
                                color: imageselected
                                    ? Tcolors.primaryColor
                                    : Colors.transparent),
                            fit: BoxFit.contain,
                            backgroundColor:
                                dark ? Tcolors.white : Tcolors.dark,
                            imgurl: images[index]);
                      });
                    },
                  ),
                ),
              ),
            ),

            Positioned(
              bottom: 24,
              left: 50,
              child: Text(
                '*prodct Image might differ from original product',
                style: Theme.of(context).textTheme.labelSmall!.copyWith(
                    color: Tcolors.darkgrey,
                    fontWeight: FontWeight.w100,
                    fontSize: 10),
              ),
            )
          ],
        ),
      ),
    );
  }
}
