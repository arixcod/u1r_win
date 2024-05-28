import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:u1r/commons/widgets/category/categorycards.dart';
import 'package:u1r/commons/widgets/custom_appbar/custom_apbbar.dart';
import 'package:u1r/commons/widgets/customsearchbar/searchbar.dart';
import 'package:u1r/commons/widgets/customtabbar/Tcustomtabbar.dart';
import 'package:u1r/commons/widgets/layouts/gridlayouts.dart';
import 'package:u1r/helpers/helper_functions.dart';
import 'package:u1r/utils/constatnts/colors.dart';
import 'package:u1r/utils/constatnts/sizes.dart';

import '../../../../commons/widgets/product/roundedcontainer.dart';
import '../../../../commons/widgets/shimmer/categoryshimmer.dart';
import '../../../../commons/widgets/shimmer/shimmer.dart';
import '../../../shop/Home/widget/Tpromslider.dart';
import '../../../shop/Screens/detailed_page_all_product.dart';
import '../../../shop/controllers/categoryController.dart';

class SubCategoryScreen extends StatelessWidget {
  SubCategoryScreen({super.key, required this.screentitle});

  final categorycontroller = Get.put(CategoryController());
  final String screentitle;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TcustomAppbar(
        tittle: Text(
          screentitle.substring(0, 1) +
              screentitle.substring(1, screentitle.length),
          style: Theme.of(context)
              .textTheme
              .headlineMedium!
              .copyWith(color: Tcolors.white),
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
          Container(
            child: Expanded(
              child: SingleChildScrollView(
                child: Obx(
                  () {
                    if (categorycontroller.isLoading.value) {
                      const Tcategoryshimmereffect(
                        itemCount: 17,
                      );
                    }

                    if (categorycontroller.allsubcategories.isEmpty) {
                      return const Center(
                        child: Center(
                            child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(Icons.error),
                            SizedBox(
                              height: Tsizes.spacebtwnitems * 2,
                            ),
                            Text(
                                "Something Went Wrong ,Please Restart The App"),
                          ],
                        )),
                      );
                    } else {
                      return Tgridlayout(
                          mainAxisExtent: 150,
                          itemCount: categorycontroller.allsubcategories.length,
                          itemBuilder: (_, index) {
                            final category =
                                categorycontroller.allsubcategories[index];
                            String imagetextname = category.Name;
                            return GestureDetector(
                              onTap: () {
                              Get.to(detailed_page_allproduct(screentitle: imagetextname,
                              subCateggoryID: category.SubaCategoryId,),transition: Transition.fadeIn);
                                },
                              child: TroundedConatiner(
                                showBorder: true,
                                backgroundColor: Tcolors.grey.withOpacity(0.1),
                                child: Column(children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 5.0,
                                    ),
                                    child: Container(
                                      width: 100,
                                      height: 100,
                                      padding: EdgeInsets.only(top: 3),
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(100)),
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(100),
                                        child: Center(
                                            child: CachedNetworkImage(
                                          width: 100,
                                          height: 100,
                                          fit: BoxFit.cover,
                                          imageUrl: category.imgUrl,
                                          progressIndicatorBuilder:
                                              (context, url, progress) {
                                            return const TShimmerWidget(
                                              width: 100,
                                              height: 100,
                                              radius: 100,
                                            );
                                          },
                                          errorWidget: (context, url, error) {
                                            return const Icon(Icons.error);
                                          },
                                        )),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: Tsizes.spacebtwnitems,
                                  ),
                                  SizedBox(
                                    height: 20,
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: Tsizes.sm),
                                      child: Text(
                                        //Category Variable
                                        category.Name.substring(0, 1)
                                                .toUpperCase() +
                                            category.Name.substring(
                                                1, imagetextname.length),
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelMedium!
                                            .copyWith(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 13,
                                                color: Tcolors.darkergrey),
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 2,
                                        textAlign: TextAlign.left,
                                      ),
                                    ),
                                  )
                                ]),
                              ),
                            );
                          });
                    }
                  },
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
