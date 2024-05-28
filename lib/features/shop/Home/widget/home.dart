import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:u1r/commons/widgets/custom_appbar/custom_apbbar.dart';
import 'package:u1r/commons/widgets/layouts/gridlayouts.dart';
import 'package:u1r/commons/widgets/product/roundedcontainer.dart';
import 'package:u1r/commons/widgets/shimmer/Tverticleproductshimmer.dart';
import 'package:u1r/features/auth/screens/all_products/all_products.dart';
import 'package:u1r/features/auth/screens/notifications/notificationsCentre.dart';
import 'package:u1r/features/shop/Home/controller/HomeController.dart';
import 'package:u1r/features/shop/Home/widget/Tpromslider.dart';
import 'package:u1r/features/shop/Home/widget/homefeaturedcategoires.dart';
import 'package:u1r/features/shop/address/adress._controller.dart';
import 'package:u1r/features/shop/controllers/productcontrollers/productgrade_controller.dart';
import 'package:u1r/utils/constatnts/Image_strings.dart';
import 'package:u1r/utils/constatnts/colors.dart';
import 'package:badges/badges.dart' as badges;
import 'package:u1r/utils/constatnts/sizes.dart';

import '../../../../commons/widgets/customsearchbar/searchbar.dart';
import '../../../../commons/widgets/primaryHeader/TprimaryHeader.dart';
import '../../../../commons/widgets/product/productcard.dart';
import '../../controllers/categoryController.dart';
import '../../controllers/productcontrollers/product_controller.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({
    super.key,
  });

  final categorycontroller = Get.put(CategoryController());
  final gradecontroller = Get.put(GradeController());

  final producontroller = Get.put(ProductController());

  final controller = Get.put(HomeController());
  final adresscontroller=Get.put(AddresController());
  //to create the global instance when app is loaded below controller and their vairable will  be created

  Future<void> _refresh() async {
    return categorycontroller.fetchCategories();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
          onRefresh: () async {
            _refresh();
          },
          child: CustomScrollView(
            slivers: [
              SliverAppBar(
                onStretchTrigger: () async {},
                title: Obx(() {
                  final cc = controller.ishometitleactive.value;
                  return Visibility(
                    visible: cc,
                    child: Text(
                      'U1r',
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.w800,
                          fontSize: 34),
                    ),
                  );
                }),
                toolbarHeight: 60,
                clipBehavior: Clip.hardEdge,
                pinned: true,
                expandedHeight: 180,
                flexibleSpace: FlexibleSpaceBar(
                  background: Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(TImages.bannerImage1),
                            fit: BoxFit.cover)),
                    child: Stack(
                      children: [
                        Positioned(
                          top: 60,
                          left: 2,
                          right: 5,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 0),
                            child: InkWell(
                              onTap: () {},
                              child: searchwidget(
                                padding: EdgeInsets.all(10),
                              ),
                            ),
                          ),
                        ),

                      ],
                    ),
                  ),
                ),
                backgroundColor: Tcolors.primaryColor,
                actions: [
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: badges.Badge(
                        badgeAnimation: const badges.BadgeAnimation.rotation(
                          animationDuration: Duration(seconds: 1),
                          colorChangeAnimationDuration: Duration(seconds: 1),
                          loopAnimation: false,
                          curve: Curves.fastOutSlowIn,
                          colorChangeAnimationCurve: Curves.easeInCubic,
                        ),
                        badgeStyle: const badges.BadgeStyle(
                            shape: badges.BadgeShape.circle,
                            badgeColor: Colors.red,
                            padding: EdgeInsets.all(4)),
                        position: badges.BadgePosition.topEnd(top: 10, end: 5),
                        child: IconButton(
                            onPressed: () {
                              Get.to(() => notificationsCentre(),
                                  opaque: true,
                                  transition: Transition.rightToLeftWithFade,
                                  duration: Duration(microseconds: 10));
                            },
                            icon: const Icon(
                              Iconsax.notification5,
                              color: Tcolors.white,
                              size: 30,
                            ))),
                  ),
                ],
                leading: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: GestureDetector(
                    onTap: () {
                      controller.Hammenu();
                    },
                    child: Container(
                      height: 35,
                      width: 35,
                      padding: const EdgeInsets.all(10),
                      decoration: const BoxDecoration(
                          color: Tcolors.primaryColor,
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                          shape: BoxShape.rectangle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12,
                              offset: Offset(0, 3),
                              blurRadius: 8,
                            )
                          ]),
                      child: Image(image: AssetImage(TImages.drawermenu1)),
                    ),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Column(
                  children: [ 
                    TprimaryHeader(
                      hieght: 250,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: Tsizes.spacebtwnitems,
                          ),
                          const SizedBox(
                            height: Tsizes.spacebtwnitems,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: Tsizes.defaultspacing),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                      Text(
                                      "Featured Categories",
                                      style: Theme.of(context)
                                      .textTheme
                                      .headlineSmall!
                                      .copyWith(color: Tcolors.white),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                const SizedBox(
                                  height: Tsizes.spacebtwnitems,
                                ),
                                const Tfeaturedcategory(),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),

                    //
                    // Here slider bannres will go
                    Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 0, horizontal: 5),
                        child: Column(
                          children: [
                            const Tpromoslider(),
                            const SizedBox(
                              height: Tsizes.spacebtwnsection,
                            ),

                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    " Top In Cashews ",
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium!
                                        .copyWith(
                                            color: Tcolors.darkergrey,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600),
                                  ),
                                  TextButton(
                                      onPressed: () {
                                        Get.to(() => allproducts(
                                              title: 'All Products ',
                                              futuremethod: producontroller
                                                  .getAllproducts(),
                                            ));
                                      },
                                      child: Text(
                                        'See All',
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleMedium!
                                            .copyWith(
                                                color: Tcolors.primaryColor,
                                                fontSize: 14),
                                      ))
                                ],
                              ),
                            ),

                            //gridlayout showing the products
                            Obx(() {
                              if (producontroller.isLoading.value) {
                                return const Tverticalproductshimmer();
                              }
                              if (producontroller.featuredproducts.isEmpty) {
                                return const Center(
                                  child: Text(
                                      "No Products Available ,Looks Like Shop is close"),
                                );
                              }

                              return Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Tgridlayout(
                                  itemCount:
                                      producontroller.featuredproducts.length,
                                  itemBuilder: (_, index) =>
                                      Tproductverticalcards(
                                    product:
                                        producontroller.featuredproducts[index],
                                  ),
                                ),
                              );
                            }),
                          ],
                        )),
                  ],
                ),
              ),
            ],
          )),
    );
  }
}

/*Banner Section Ends Here */

class ThomeAppbar extends StatelessWidget {
  final controller = Get.put(HomeController());
  BuildContext context;
  ThomeAppbar({super.key, required this.context});

  @override
  Widget build(BuildContext context) {
    return TcustomAppbar(
      tittle: GestureDetector(
        onTap: () {
          controller.Hammenu();
        },
        child: Container(
          height: 35,
          width: 35,
          padding: const EdgeInsets.all(8),
          decoration: const BoxDecoration(
              color: Tcolors.white,
              borderRadius: BorderRadius.all(Radius.circular(8)),
              shape: BoxShape.rectangle,
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  offset: Offset(0, 3),
                  blurRadius: 8,
                )
              ]),
          child: Image.asset(TImages.drawermenu1),
        ),
      ),
      actions: [
        Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: badges.Badge(
                  badgeAnimation: const badges.BadgeAnimation.rotation(
                    animationDuration: Duration(seconds: 1),
                    colorChangeAnimationDuration: Duration(seconds: 1),
                    loopAnimation: false,
                    curve: Curves.fastOutSlowIn,
                    colorChangeAnimationCurve: Curves.easeInCubic,
                  ),
                  badgeStyle: const badges.BadgeStyle(
                      shape: badges.BadgeShape.circle,
                      badgeColor: Colors.red,
                      padding: EdgeInsets.all(4)),
                  position: badges.BadgePosition.topEnd(top: 10, end: 5),
                  child: IconButton(
                      onPressed: () {
                        Get.to(() => notificationsCentre());
                      },
                      icon: const Icon(
                        Iconsax.notification5,
                        color: Tcolors.white,
                        size: 30,
                      ))),
            ),
          ],
        )
      ],
    );
  }
}
