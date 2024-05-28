import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:u1r/commons/widgets/shimmer/shimmer.dart';
import 'package:u1r/features/shop/Home/controller/HomeController.dart';
import 'package:u1r/features/shop/controllers/bannercontroller.dart';

import '../../../../commons/widgets/bannerImages/TroundedbannerImages.dart';
import '../../../../commons/widgets/custom shapes/customshapes/customshape.dart';
import '../../../../utils/constatnts/colors.dart';
import '../../../../utils/constatnts/sizes.dart';

class Tpromoslider extends StatelessWidget {
  const Tpromoslider({
    super.key,
   });

  
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(BannerController());

    return Obx(()
      {

       if(controller.isLoading.value) return const TShimmerWidget(width: double.infinity, height: 190);
       if(controller.bannerss.isEmpty) {return const Center(child: Text("Oops Something Went Wrong !"),);
        }else
        {return Column(children: [
              CarouselSlider(
              items:controller.bannerss 
                .map(
                  (banner) => TroundedBannerImage(
                    isNetworkImage: true,
                    width: 350,
                    fit: BoxFit.cover,
                    imgurl: banner.imgUrl,
                    applyImageradius: true,
                    onPressed: () => Get.toNamed(banner.targetScreen)
                  ),
                )
                .toList(),
            options: CarouselOptions(
              onPageChanged: (index, _) {
                controller.updatePageIndicator(index);
              },
              viewportFraction: 1,
            )),
        const SizedBox(
          height: Tsizes.spacebtwnitems,
        ),
        Obx(
          () => Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (int i = 0; i < controller.bannerss.length; i++)
                Tcircular(
                  margin: const EdgeInsets.only(right: 5),
                  width: 15,
                  height: 4,
                  backgroundColor: controller.carouselControlleindexr.value == i
                      ? Tcolors.primaryColor
                      : Tcolors.accent,
                )
            ],
          ),
        )
      ]);
}      }
    );
  }
}
