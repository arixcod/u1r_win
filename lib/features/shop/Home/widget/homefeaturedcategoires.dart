import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:u1r/features/shop/Home/widget/home.dart';
import 'package:u1r/features/shop/controllers/categoryController.dart';

import '../../../../commons/widgets/shimmer/categoryshimmer.dart';
import '../../../../commons/widgets/shimmer/shimmer.dart';
import '../../../../utils/constatnts/Image_strings.dart';
import '../../../../utils/constatnts/colors.dart';
import '../../../../utils/constatnts/sizes.dart';

class Tfeaturedcategory extends StatelessWidget {


  const Tfeaturedcategory({
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    final categorycontroller=Get.put(CategoryController());
    return 
    
   Obx ((){

      if(categorycontroller.isLoading.value) return const Tcategoryshimmereffect(itemCount: 6,);
      if(categorycontroller.featuredcategories.isEmpty) {
          return const Center(child: Text("Nothing found"),);
      } 
        return Padding(
          padding: const EdgeInsets.only(top: 15),
          child: SizedBox(
             height: 100,
             child: ListView.builder(
              shrinkWrap: true,
              itemCount: categorycontroller.featuredcategories.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                 final category=categorycontroller.featuredcategories[index];
                   return TverticalImageTextCategory(
                   onTap: () {},
                    image: category.image,
                    tittle: category.name,  
                    textcolor: Tcolors.white,
                    backgroundColor: Tcolors.white,
                );
              }),
              ),
        );}
    );
  }
}







class TverticalImageTextCategory extends StatelessWidget {
  const TverticalImageTextCategory({
    super.key,
    this.isNetworkImage=true,
    required this.image,
    required this.tittle,
    required this.textcolor,
    required this.backgroundColor,
    this.onTap,
  });
  final bool? isNetworkImage; 
  final String image, tittle;
  final Color textcolor;
  final Color backgroundColor;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: 80,
        child: Padding(
          padding: const EdgeInsets.only(right: 8),
          child: Column(
            children: [
              //Image here
      
               
              Container(
                width: 75,
                height: 75,
                padding: const EdgeInsets.all(Tsizes.md),
                decoration: BoxDecoration(
                    color: backgroundColor,
                    borderRadius: BorderRadius.circular(100)),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Center(
                      child: isNetworkImage!?
                        CachedNetworkImage(
                        
                        fit: BoxFit.cover,
                        imageUrl: image,
                        progressIndicatorBuilder: (context, url, progress) {
                          return const TShimmerWidget(width: 80, height: 80,radius:100,);
                        },
                        errorWidget: (context, url, error) {
                          return const Icon(Icons.error);
                        },
                        )
                      :
                       Image(
                       image: AssetImage(image,),
                       fit: BoxFit.cover,
                     
                                      ),
                                    ),
                    ),
              ),
              const SizedBox(
                height: Tsizes.spacebtwnitems / 2,
              ),
              Text(
                tittle,
                 overflow: TextOverflow.ellipsis,
                  style: Theme.of(context)
                    .textTheme
                    .labelMedium!
                    .copyWith(color: Tcolors.white),
              )
            ],
          ),
        ),
      ),
    );
  }
}




