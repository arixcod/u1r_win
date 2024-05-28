import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:u1r/commons/widgets/custom_appbar/custom_apbbar.dart';
import 'package:u1r/commons/widgets/customtabbar/Tcustomtabbar.dart';
import 'package:u1r/features/auth/screens/chechout/checkout.dart';
import 'package:u1r/features/auth/screens/marketwatchlist/marketwatchlistwidget.dart';
import 'package:u1r/helpers/helper_functions.dart';

import '../../../../commons/widgets/product/roundedcontainer.dart';
import '../../../../utils/constatnts/colors.dart';
import '../../../../utils/constatnts/sizes.dart';

class MarketWatchlist extends StatelessWidget {
  const MarketWatchlist({super.key});

  @override
  Widget build(BuildContext context) {
    final dark =THelperFunctions.isDarkMode(context);
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: TcustomAppbar(
          tittle: Text('Market Trends',
              style: Theme.of(context)
                  .textTheme
                  .headlineMedium!
                  .copyWith(color: Tcolors.white)),
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Icon(
                Iconsax.trend_up,
                color: Tcolors.white,
              ),
            )
          ],
        ),
        body: Column(
          children: [
            Container(
              color: Tcolors.grey.withOpacity(0.4),
              padding: EdgeInsets.all(12),
              child: SizedBox(
                width: double.infinity,
                child: TroundedConatiner(
                  backgroundColor: dark?Tcolors.blck:Tcolors.light,
                  showBorder: true,
                  padding: EdgeInsets.symmetric(
                      horizontal: Tsizes.defaultspacing / 2,
                      vertical: Tsizes.defaultspacing / 1.5),
                  child: Wrap(
                    direction: Axis.horizontal,
                    crossAxisAlignment: WrapCrossAlignment.start,
                    children: [
                      SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            style: const ButtonStyle(
                                side: MaterialStatePropertyAll(BorderSide.none),
                                backgroundColor: MaterialStatePropertyAll(
                                    Tcolors.primaryColorbtnshade)),
                            onPressed: () {
                              // Order review Page for the checkout
                              Get.to(() => const CheckoutScree());
                            },
                            child: Text.rich(TextSpan(
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall!
                                    .copyWith(
                                        fontWeight: FontWeight.w500,
                                        color: Tcolors.white),
                                children: const [
                                  TextSpan(text: "Create a watchlist  "),
                                ])),
                          )),
                      const SizedBox(
                        width: 10,
                      ),
                      Text("Note ** : ",
                          style: Theme.of(context)
                              .textTheme
                              .labelMedium!
                              .copyWith(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  fontStyle: FontStyle.italic)),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text(
                            "Here You can create Watchlist to track product price",
                            softWrap: true,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context)
                                .textTheme
                                .labelLarge!
                                .copyWith(fontSize: 13)),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Ttabbar(
              tabs: [
                Tab(
                  child: Text("Watchlist"),
                ),
                Tab(
                  child: Text("Order Book"),
                ),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  ListView.builder(
                    itemCount: 10,
                    itemBuilder: (BuildContext context, int index) {
                            return Padding(
                            padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 1),
                            child: const TmarketItemwidget(),
                        );
                    },
                  ),
                  Container(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
