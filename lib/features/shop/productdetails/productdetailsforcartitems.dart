import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:readmore/readmore.dart';
import 'package:u1r/commons/widgets/addtocartwidget/addtocartwidget.dart';
import 'package:u1r/commons/widgets/cartmenuIcon/cartmenuIcon.dart';
import 'package:u1r/commons/widgets/custom_appbar/custom_apbbar.dart';
import 'package:u1r/commons/widgets/product/roundedcontainer.dart';
import 'package:u1r/features/shop/models/product_model.dart';
import 'package:u1r/helpers/helper_functions.dart';
import 'package:u1r/utils/constatnts/colors.dart';
import 'package:u1r/utils/constatnts/sizes.dart';

import '../../../commons/widgets/product/TproductImageslider.dart';
import '../../auth/controllers/ProductDetailcontroller.dart';
import '../controllers/productcontrollers/productgrade_controller.dart';
import './productshareandratingwidget.dart';

class ProductdetailcreenforCartitems extends StatelessWidget {
  const ProductdetailcreenforCartitems(
      {super.key,
      required this.product,
      required this.selectedgrades,
      required this.selectedweights});

  final Rx<ProductModel> product;
  final selectedgrades;
  final selectedweights;

  final bool visiblitygrades = false;
  @override
  Widget build(BuildContext context) {
    // To perform the controller cleanup after this screen closes

    final grades = Get.put(ProductDetailcontroller());

    // final grades = GradeController.instance;
    // final all_grade = grades.getAllgrades(product);
    // final allweights = grades.getAllweightoptions(product);
    final dark = THelperFunctions.isDarkMode(context);

    return Scaffold(
      appBar: TcustomAppbar(
        showBackArrow: true,
        tittle: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              'U1r',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w800,
                  fontSize: 34),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 4),
              child: Icon(
                Icons.shopping_cart,
                size: 14,
                color: Colors.white,
              ),
            )
          ],
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 25),
            child: cartmenuicon(),
          ),
        ],
      ),
      body: Obx(
        () {
          final product_value = product.value;

          if (product_value.productId == '') {
            return LinearProgressIndicator();
          } else {
            final all_grade =grades.getAllgrades(product_value, selectedgrades);
            final allweights =grades.getAllweightoptions(product_value, selectedweights);
              print(product.value.isgraded);
            // we here calling the same gradecontroller instance
            final gradecontroller = GradeController.instance;
            return SingleChildScrollView(
              child: Column(
                children: [
                  // product Image slider for the Image details Page
                  TproductImageslider(product: product.value),

                  // product details goes Here

                  Padding(
                    padding: const EdgeInsets.only(
                      right: Tsizes.defaultspacing,
                      left: Tsizes.defaultspacing,
                      bottom: Tsizes.defaultspacing,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //Rating of the product
                        const TratingandShare(),

                        const SizedBox(
                          height: Tsizes.spacebtwnitems,
                        ),
                        //price and sales tag

                        (product_value.grades.length == 1 &&
                                product_value.grades.first.grade == '')
                            ? Row(
                                children: [
                                  TroundedConatiner(
                                      radius: Tsizes.sm,
                                      backgroundColor:
                                          Tcolors.secondary.withOpacity(0.8),
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: Tsizes.sm,
                                          vertical: Tsizes.xs),
                                      child: Text(
                                        "25%",
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelLarge!
                                            .apply(color: Tcolors.blck),
                                      )),
                                  const SizedBox(
                                    width: Tsizes.spacebtwnitems,
                                  ),
                                  const Icon(
                                    IconData(0xf05db,
                                        fontFamily: 'MaterialIcons'),
                                    size: 12,
                                  ),
                                  Text(
                                    product_value.productPrice,
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleSmall!
                                        .copyWith(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                            decoration:
                                                TextDecoration.lineThrough),
                                  ),
                                  const SizedBox(
                                    width: Tsizes.spacebtwnitems / 2,
                                  ),
                                  const Icon(
                                    IconData(0xf05db,
                                        fontFamily: 'MaterialIcons'),
                                    size: 15,
                                  ),
                                  Text(
                                    product_value.Productactualprice,
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineMedium!
                                        .copyWith(
                                          fontWeight: FontWeight.w600,
                                        ),
                                  ),
                                ],
                              )
                            : Obx(() {
                                return Row(
                                  children: [
                                    TroundedConatiner(
                                        radius: Tsizes.sm,
                                        backgroundColor:
                                            Tcolors.secondary.withOpacity(0.8),
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: Tsizes.sm,
                                            vertical: Tsizes.xs),
                                        child: Text(
                                          "25%",
                                          style: Theme.of(context)
                                              .textTheme
                                              .labelLarge!
                                              .apply(color: Tcolors.blck),
                                        )),
                                    const SizedBox(
                                      width: Tsizes.spacebtwnitems,
                                    ),
                                    const Icon(
                                      IconData(0xf05db,
                                          fontFamily: 'MaterialIcons'),
                                      size: 12,
                                    ),
                                    Text(
                                      grades.selectedGrade['price'],
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleSmall!
                                          .copyWith(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500,
                                              decoration:
                                                  TextDecoration.lineThrough),
                                    ),
                                    const SizedBox(
                                      width: Tsizes.spacebtwnitems / 2,
                                    ),
                                    const Icon(
                                      IconData(0xf05db,
                                          fontFamily: 'MaterialIcons'),
                                      size: 15,
                                    ),
                                    Text(
                                      grades.selectedGrade['salesPrice'],
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineMedium!
                                          .copyWith(
                                            fontWeight: FontWeight.w600,
                                          ),
                                    ),
                                  ],
                                );
                              }),

                        const SizedBox(
                          height: Tsizes.spacebtwnitems,
                        ),

                        // product Name

                        //check if grades are available

                        (product_value.grades.length == 1 &&
                                product_value.grades.first.grade == '')
                            ? Text(
                                product_value.productname,
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium!
                                    .copyWith(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600),
                              )
                            : Obx(() {
                                return Text(
                                  product_value.productname +
                                      '  (count-${grades.selectedGrade['count']})',
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium!
                                      .copyWith(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w600),
                                );
                              }),

                        const SizedBox(
                          height: Tsizes.spacebtwnitems,
                        ),
                        // product grade if Needed
                        //designing the product details section which will be only rendered if needed e.g in case of branded products

                        Obx(() {
                            final selectedweight={grades.selectedweight['weight']};
                  
                          return Column(
                            children: [
                              //pricing Attributes

                              TroundedConatiner(
                                backgroundColor:
                                    dark ? Tcolors.darkergrey : Tcolors.grey,
                                child: Padding(
                                  padding: const EdgeInsets.all(Tsizes.md),
                                  child: Column(
                                    children: [
                                      productdetailtile(
                                        headingtitle: 'Type',
                                        headingvalue: product_value.variations,
                                      ),
                                      productdetailtile(
                                        headingtitle: 'Brand',
                                        headingvalue: product_value.brandName,
                                      ),
                                      productdetailtile(
                                        headingtitle: 'Weight',
                                        headingvalue:
                                            selectedweight.first==''?'${product_value.productWeight} Kg':
                                            '${grades.selectedweight['weight']}'
                                            'kg',
                                      ),
                                      productdetailtile(
                                        headingtitle: 'Packaging ',
                                        headingvalue: 'Carton',
                                      ),
                                      productdetailtile(
                                        headingtitle: 'Category',
                                        headingvalue: 'Veg',
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          );
                        }),

                        const SizedBox(
                          height: Tsizes.spacebtwnitems,
                        ),

                        // product grade

                        (product_value.grades.length == 1 &&
                                product_value.grades.first.grade == '')
                            ?
                            //if grades not  available

                            Container()
                            : Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Grade',
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleMedium!
                                            .copyWith(
                                                fontWeight: FontWeight.w600),
                                      ),
                                      const SizedBox(
                                        height: Tsizes.spacebtwnitems / 2.5,
                                      ),
                                      Text(
                                        '*Grade denotes the count in 100gms ',
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelSmall!
                                            .copyWith(
                                                color: Tcolors.darkgrey,
                                                fontWeight: FontWeight.w200,
                                                fontSize: 12),
                                      ),
                                    ],
                                  ),

                                  const SizedBox(
                                    height: Tsizes.spacebtwnitems,
                                  ),

                                  //product grading is done here

                                  SizedBox(
                                    height: 40,
                                    child: ListView.separated(
                                      shrinkWrap: true,
                                      scrollDirection: Axis.horizontal,
                                      separatorBuilder: (_, __) =>
                                          const SizedBox(
                                        width: Tsizes.spacebtwnitems / 2,
                                      ),
                                      itemCount: all_grade.length,
                                      itemBuilder: (_, index) {
                                        return Obx(() {
                                          //get the selected grade
                                          int all_grades_lenght =
                                              all_grade.length;
                                          //index of selected grade
                                          int slectedgradeIndex = 0;
                                          final selectegrade =
                                              grades.selectedGrade;

                                          for (int i = 0;
                                              i < all_grades_lenght;
                                              i++) {
                                            if (all_grade[i]['grade'] ==
                                                selectegrade['grade']) {
                                              slectedgradeIndex = i;
                                            }
                                          }
                                          //find where index  of selected grade

                                          final tgrades =
                                              product_value.grades[index].grade;
                                          final currentselectedgrade =
                                              all_grade[index] ==
                                                  all_grade[slectedgradeIndex];

                                          return TgradeproductContainer(
                                            color: currentselectedgrade
                                                ? Tcolors.primaryColor
                                                : Tcolors.darkgrey,
                                            title: tgrades,
                                            onPressed: () {
                                              gradecontroller.selectedGrade
                                                  .value = all_grade[index];
                                              selectegrade.value =
                                                  all_grade[index];
                                            },
                                          );
                                        });
                                      },
                                    ),
                                  )
                                ],
                              ),

                        const SizedBox(
                          height: Tsizes.spacebtwnitems,
                        ),

                        (product_value.weightOptions.length == 1 &&
                                product_value.weightOptions.first.weight == '')
                            ?
                            //if product weight options  are  not  available

                            Container()
                            : Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Weight Options',
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium!
                                        .copyWith(fontWeight: FontWeight.w600),
                                  ),
                                  const SizedBox(
                                    height: Tsizes.spacebtwnitems,
                                  ),
                                  SizedBox(
                                    height: 40,
                                    child: ListView.separated(
                                      shrinkWrap: true,
                                      scrollDirection: Axis.horizontal,
                                      separatorBuilder: (_, __) =>
                                          const SizedBox(
                                        width: Tsizes.spacebtwnitems / 2,
                                      ),
                                      itemCount: allweights.length,
                                      itemBuilder: (_, index) {
                                        return Obx(() {
                                          //get the selected grade
                                          int all_weight_lenght =
                                              allweights.length;
                                          //index of selected grade
                                          int selectedweightIndex = 0;

                                          final selectedweight =
                                              grades.selectedweight;

                                          for (int i = 0;
                                              i < all_weight_lenght;
                                              i++) {
                                            if (allweights[i]['weight'] ==
                                                selectedweight['weight']) {
                                              selectedweightIndex = i;
                                            }
                                          }

                                          final currentselectedweight =
                                              allweights[index] ==
                                                  allweights[
                                                      selectedweightIndex];

                                          return TgradeproductContainer(
                                            radius: 5,
                                            width: 85,
                                            height: 50,
                                            title: allweights[index]['weight'],
                                            color: currentselectedweight
                                                ? Tcolors.primaryColor
                                                : Tcolors.darkgrey,
                                            onPressed: () {
                                              gradecontroller.selectedweight
                                                  .value = allweights[index];

                                              selectedweight.value =
                                                  allweights[index];
                                            },
                                          );
                                        });
                                      },
                                    ),
                                  ),
                                ],
                              ),

                        // now the weight options if Available

                        //Check button to instantly buy the product
                        const SizedBox(
                          height: Tsizes.spacebtwnitems * 2,
                        ),

                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                              style: const ButtonStyle(
                                  side:
                                      MaterialStatePropertyAll(BorderSide.none),
                                  backgroundColor: MaterialStatePropertyAll(
                                      Tcolors.primaryColorbtnshade)),
                              onPressed: () {},
                              child: const Text('Buy Now')),
                        ),

                        const SizedBox(
                          height: Tsizes.spacebtwnitems,
                        ),
                        Text(
                          'Description',
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(
                          height: Tsizes.spacebtwnitems,
                        ),

                        ReadMoreText(
                          product_value.productDetails,
                          trimLines: 2,
                          trimMode: TrimMode.Line,
                          trimCollapsedText: 'show more',
                          trimExpandedText: 'show less',
                          moreStyle: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                          lessStyle: const TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w600),
                        )
                      ],
                    ),
                  )
                ],
              ),
            );
          }
        },
      ),
      bottomNavigationBar: Obx(() {
        final product_value = product.value;
        return addtocartwidgetDetailScreen(
          product: product_value,
        );
      }),
    );
  }
}

class TgradeproductContainer extends StatelessWidget {
  const TgradeproductContainer({
    super.key,
    required this.color,
    this.height = 40,
    this.width = 60,
    this.radius = 8,
    required this.title,
    required this.onPressed,
  });

  final Color color;
  final String title;
  final VoidCallback onPressed;
  final double height, width, radius;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: TroundedConatiner(
        radius: radius,
        height: height,
        width: width,
        backgroundColor: color,
        child: Center(
            child: Text(
          title,
          style: Theme.of(context)
              .textTheme
              .bodySmall!
              .copyWith(fontWeight: FontWeight.w600, color: Tcolors.white),
        )),
      ),
    );
  }
}

class productdetailtile extends StatelessWidget {
  const productdetailtile({
    super.key,
    required this.headingtitle,
    required this.headingvalue,
  });

  final String headingtitle, headingvalue;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          headingtitle,
          style: Theme.of(context)
              .textTheme
              .titleMedium!
              .copyWith(fontWeight: FontWeight.w600),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 30),
          child: Text(
            headingvalue,
            style: Theme.of(context)
                .textTheme
                .bodySmall!
                .copyWith(fontWeight: FontWeight.w400),
          ),
        )
      ],
    );
  }
}
