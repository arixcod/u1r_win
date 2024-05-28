import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:u1r/commons/widgets/bannerImages/TroundedbannerImages.dart';
import 'package:u1r/commons/widgets/custom_appbar/custom_apbbar.dart';
import 'package:u1r/commons/widgets/layouts/gridlayouts.dart';
import 'package:u1r/commons/widgets/product/productcard.dart';
import 'package:u1r/features/shop/productdetails/productdetails.dart';
import 'package:u1r/utils/constatnts/colors.dart';
import 'package:u1r/utils/constatnts/sizes.dart';

import '../../../../commons/widgets/cartmenuIcon/cartmenuIcon.dart';
import '../../../search_feature/search_controller.dart';

class SeacrhScreen extends StatelessWidget {
  SeacrhScreen({super.key});

  TextEditingController searchbarEditingcontroller = TextEditingController();

  final TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(Searchbarcontroller());
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
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
            child: cartmenuicon(
             ),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
          child: Column(children: [
            SearchBar(
              onTap: () {},
              controller: searchbarEditingcontroller,
              onChanged: (value) {
                controller.setSearchText(value);

                if (value.isEmpty) {
                  controller.autosearch.clear();
                }

                debounce(
                    controller.searchText,
                    (callback) => controller
                        .getautosugestions(controller.searchText.value),
                    time: Duration(milliseconds: 500));
              },
              // controller: controller.searcheditingcontroller.value,
              leading: Icon(Icons.search),
              onSubmitted: (value) async {
                controller.autosearch.clear();
                await controller.performSearch(value.toString().trim());
              },
              trailing: [
                TextButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Tcolors.primaryColor),
                    onPressed: () async {
                      controller.autosearch.clear();
                      await controller.performSearch(
                          searchbarEditingcontroller.text.toString().trim());
                    },
                    child: Text(
                      "Search",
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(color: Tcolors.white),
                    ))
              ],

              hintText: "Search 'Almond'",
            ),
            SizedBox(height: Tsizes.spacebtwnitems),
            Expanded(
              child: Stack(
                children: [
                  Obx(() {
                    final loader = controller.isloading;
                    if (loader.value == true) {
                      return Padding(
                        padding: const EdgeInsets.all(30.0),
                        child: Center(
                          child: CircularProgressIndicator(
                              color: Tcolors.primaryColor),
                        ),
                      );
                    } else {
                      if (controller.isdatafoundempty.value) {
                        return Padding(
                          padding: const EdgeInsets.all(50),
                          child: Center(
                              child: Text(
                                  "Searched Item '${searchbarEditingcontroller.text.trim()}' didn't match anything")),
                        );
                      } else {
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 50, horizontal: 5),
                          child: SingleChildScrollView(
                            child: Tgridlayout(
                              itemCount: controller.productss.length,
                              itemBuilder: (_, index) {
                                return Tproductverticalcards(
                                    product: controller.productss[index]);
                              },
                            ),
                          ),
                        );
                      }
                    }
                  }),
                  Obx(() {
                    final search_res = controller.autosearch;

                    return search_res.isNotEmpty
                        ? Container(
                            height: 240,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: Tcolors.white),
                            child: ListView.builder(
                                shrinkWrap: true,
                                itemCount: controller.autosearch.length,
                                itemBuilder: (context, index) {
                                  return Column(
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          
                                          
                                          
                                          controller.getoneProductdata(search_res[index]['productID']);

                                         // print(search_res[index]['productID']);
                                         
                                         // Navigate to their Respective Product Detail Screen
                                         // Also Get the Product id From the Backend   
                                         // Then using product Id Get the Product Data and convert it product Model
                                        //  we will get to  the screen     
                                          //Productdetailcreen()
                                          },
                                        child: Container(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 20, vertical: 4),
                                          decoration: BoxDecoration(),
                                          height: 40,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                search_res[index]['name'] ?? '',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .titleMedium,
                                              ),
                                              Row(
                                                children: [
                                                  TroundedBannerImage(
                                                      isNetworkImage: true,
                                                      height: 40,
                                                      width: 40,
                                                      applyImageradius: true,
                                                      borderRadius: 5,
                                                      imgurl: search_res[index]
                                                              ['image'] ??
                                                          ''),
                                                  const SizedBox(
                                                    width: 10,
                                                  ),
                                                  Icon(
                                                    Icons.arrow_outward,
                                                    color: Tcolors.darkergrey,
                                                    size: 20,
                                                  )
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      )
                                    ],
                                  );
                                }),
                          )
                        : Container();
                  }),
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
