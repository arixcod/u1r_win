import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:u1r/commons/widgets/layouts/gridlayouts.dart';
import 'package:u1r/commons/widgets/product/roundedcontainer.dart';
import 'package:u1r/features/auth/screens/subcategoryscreen/subcategoryscreen.dart';

import '../../../features/shop/controllers/categoryController.dart';
import '../../../helpers/helper_functions.dart';
import '../../../utils/constatnts/colors.dart';
import '../../../utils/constatnts/sizes.dart';
import '../shimmer/categoryshimmer.dart';
import '../shimmer/shimmer.dart';

class Tcategorycards extends StatelessWidget {
  const Tcategorycards({super.key});

    @override
    Widget build(BuildContext context) {
    final categorycontroller = Get.put(CategoryController());
    final dark = THelperFunctions.isDarkMode(context);
      
      return Obx(() {
      
      if (categorycontroller.isLoading.value)  const Tcategoryshimmereffect( itemCount: 17,);

      if (categorycontroller.featuredcategories.isEmpty) {
        return const Center(
          child: Center(child: Text("Something Went Wrong ,Please Restart The App")),
        );
      }

      return Tgridlayout(
          mainAxisExtent: 150,
          itemCount: categorycontroller.allcategories.length,
          itemBuilder: (_, index) {
            final category = categorycontroller.allcategories[index];
            String imagetextname=category.name;
            return GestureDetector(
              onTap: () async{

                
                 await categorycontroller.fetchsubCategories(category.id);
                Get.to(()=>SubCategoryScreen(screentitle: category.name),transition: Transition.rightToLeft);
              },
              child: TroundedConatiner(
                showBorder: true,
                backgroundColor: Tcolors.grey.withOpacity(0.1),
                child: Column(
                  children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5.0,),
                    child: Container(
                          width: 100,
                          height: 100,
                          padding: EdgeInsets.only(top: 3),
                          decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(100)),
                          child: ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: Center(
                          child: CachedNetworkImage(
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover,
                          imageUrl: category.image,
                          progressIndicatorBuilder: (context, url, progress) {
                            return const TShimmerWidget(
                              width:100,
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
                    height: Tsizes.spacebtwnitems ,
                  ),
                 
                   SizedBox(
                    height: 20,
                    child: Padding(
                      padding: const EdgeInsets.only(left: Tsizes.sm),
                      child: Text(
                        //Category Variable
                           category.name.substring(0,1).toUpperCase()+category.name.substring(1,imagetextname.length),
                           style: Theme.of(context).textTheme.labelMedium!.copyWith(
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
            }
          );
    });
  }
}
