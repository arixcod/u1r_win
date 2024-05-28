import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:u1r/commons/widgets/category/categorycards.dart';
import 'package:u1r/commons/widgets/custom_appbar/custom_apbbar.dart';
import 'package:u1r/commons/widgets/customsearchbar/searchbar.dart';
import 'package:u1r/commons/widgets/customtabbar/Tcustomtabbar.dart';

import 'package:u1r/helpers/helper_functions.dart';
import 'package:u1r/utils/constatnts/colors.dart';
import 'package:u1r/utils/constatnts/sizes.dart';

import '../../../shop/Home/widget/Tpromslider.dart';
import '../../../shop/controllers/categoryController.dart';

class CategoryScreen extends StatelessWidget {
  CategoryScreen({super.key});

  final categorycontroller = Get.put(CategoryController());

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: TcustomAppbar(
            tittle: Text('Category',
                style: Theme.of(context)
                    .textTheme
                    .headlineMedium!
                    .copyWith(color: Tcolors.white)),
            actions: const [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Icon(
                  Iconsax.shop,
                  color: Tcolors.white,
                  size: 30,
                ),
              )
            ],
          ),
          body: Obx(
            () {
              return ModalProgressHUD(
                opacity: 0.1,
                progressIndicator: Center(
                  child: CircularProgressIndicator(
                    color: Tcolors.primaryColor,
                  ),
                ),
                inAsyncCall: categorycontroller.isLoading.value,
                child: NestedScrollView(
                    headerSliverBuilder: (_, innerboxScrollable) {
                      return [
                        SliverAppBar(
                        
                          stretch: true,
                          automaticallyImplyLeading: false,
                          pinned: true,
                          floating: true,
                          backgroundColor: THelperFunctions.isDarkMode(context)
                              ? Tcolors.dark
                              : Tcolors.white,
                          expandedHeight: 400,

                          flexibleSpace: Padding(
                          
                            padding:
                                const EdgeInsets.all(Tsizes.defaultspacing),
                            child: ListView(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              children: const [
                                //adding search bar

                                SizedBox(
                                  height: Tsizes.spacebtwInputField,
                                ),
                                searchwidget(
                                  padding: EdgeInsets.zero,
                                ),
                                SizedBox(
                                  height: Tsizes.spacebtwnsection,
                                ),
                                Tpromoslider()
                              ],
                            ),
                          ),

                          //Tab Bar for future use if needed

                          bottom: const Ttabbar(tabs: [
                            Tab(
                              child: Text("All"),
                            ),
                            Tab(
                              child: Text("Featured"),
                            ),
                          ]),
                        )
                      ];
                    },
                    body: TabBarView(
                      children: [
                        ListView(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          children: const [
                            Padding(
                              padding: EdgeInsets.all(Tsizes.defaultspacing),
                              child: Column(
                                children: [Tcategorycards()],
                              ),
                            )
                          ],
                        ),
                        Container(),
                      ],
                    )),
              );
            },
          )),
    );
  }
}
