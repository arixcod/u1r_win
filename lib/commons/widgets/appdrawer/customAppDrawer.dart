import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:u1r/commons/widgets/shimmer/shimmer.dart';
import 'package:u1r/features/auth/controllers/user_profile_controller.dart';
import 'package:u1r/features/auth/screens/myorderscreen/myorder.dart';
import 'package:u1r/features/auth/screens/notifications/notificationsCentre.dart';
import 'package:u1r/features/models/user_model.dart';
import 'package:u1r/features/shop/Home/controller/HomeController.dart';
import 'package:u1r/features/shop/wishlist/wishlist.dart';

import '../../../features/personilaztion/Screens/userprofileScreen.dart';
import '../../../features/shop/address/address.dart';
import '../../../utils/constatnts/colors.dart';
import '../../../utils/constatnts/sizes.dart';
import '../primaryHeader/TprimaryHeader.dart';

class CustomAppdrawer extends StatelessWidget {
  const CustomAppdrawer({super.key, required this.user});
  final Rx<UserModel>? user;
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserProfileController());

    final drawercontroller = Get.put(HomeController());
    return Column(
      children: [
        Container(
          child: TprimaryHeader(
              hieght: 250,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 40),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(left: 80.0),
                          child: CircleAvatar(
                            backgroundImage: AssetImage(
                                "assets/images/category_images/default-avatar.png"),
                            radius: 40,
                          ),
                        ),
                        const SizedBox(
                          width: Tsizes.spacebtwnsection + 50,
                        ),
                        GestureDetector(
                            onTap: () {
                              // To Edit the profile Data of the User

                              Get.to(
                                  () => UserprofileScreen(
                                        user: user,
                                      ),
                                  opaque: true,
                                  transition: Transition.rightToLeftWithFade,
                                  duration: Duration(microseconds: 10));

                              //And Close the drawer to Make Sure the data is updated on it
                              drawercontroller.closeHame();
                            },
                            child: const Icon(
                              Iconsax.edit,
                              color: Tcolors.white,
                            ))
                      ],
                    ),
                    const SizedBox(
                      height: Tsizes.spacebtwnitems,
                    ),
                    Obx(() {
                      if (controller.isloading.value) {
                        return TShimmerWidget(width: 80, height: 15);
                      } else {
                        return Text(
                          user!.value.first + ' ' + user!.value.last,
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall!
                              .copyWith(
                                  fontWeight: FontWeight.w500,
                                  color: Tcolors.white),
                        );
                      }
                    }),
                    Obx(
                      () => Text(
                        user!.value.email,
                        style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            fontWeight: FontWeight.w500, color: Tcolors.white),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              )),
        ),
        ListTile(
          onTap: () {
            Get.to(() => MyOrdersScreen(),
                opaque: true,
                transition: Transition.rightToLeftWithFade,
                duration: Duration(microseconds: 10));
          },
          title: Text(
            "My Orders",
            style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  fontWeight: FontWeight.w500,
                ),
          ),
          leading: const Icon(
            Iconsax.shopping_bag,
            size: 25,
          ),
        ),
        ListTile(
          onTap: () {
            //go to the Notifications centre

            Get.to(() => notificationsCentre(),
                opaque: true,
                transition: Transition.rightToLeftWithFade,
                duration: Duration(microseconds: 10));
          },
          title: Text(
            "Notifications",
            style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  fontWeight: FontWeight.w500,
                ),
          ),
          leading: const Icon(
            Iconsax.notification,
            size: 25,
          ),
        ),
        ListTile(
          onTap: () {
            //go to the address Screen
            Get.to(() => const Addresscreen(),
                opaque: true,
                transition: Transition.rightToLeftWithFade,
                duration: Duration(microseconds: 10));
          },
          title: Text(
            "My Addresses",
            style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  fontWeight: FontWeight.w500,
                ),
          ),
          leading: const Icon(
            Iconsax.location,
            size: 25,
          ),
        ),
        ListTile(
          onTap: () {},
          title: Text(
            "Payments",
            style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  fontWeight: FontWeight.w500,
                ),
          ),
          leading: const Icon(
            Iconsax.money,
            size: 25,
          ),
        ),
        ListTile(
          onTap: () {},
          title: Text(
            " Order Book",
            style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  fontWeight: FontWeight.w500,
                ),
          ),
          leading: const Icon(
            Iconsax.book,
            size: 25,
          ),
        ),
        ListTile(
          onTap: () {
            Get.to(const WishlistScreen(),
                opaque: true,
                transition: Transition.rightToLeftWithFade,
                duration: Duration(microseconds: 10));
          },
          title: Text(
            "Wishlist",
            style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  fontWeight: FontWeight.w500,
                ),
          ),
          leading: const Icon(
            Iconsax.heart,
            size: 25,
          ),
        ),
        ListTile(
          onTap: () {
            Get.to(const WishlistScreen());
          },
          title: Text(
            "Setting",
            style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  fontWeight: FontWeight.w500,
                ),
          ),
          leading: const Icon(
            Iconsax.setting,
            size: 25,
          ),
        ),
        ListTile(
          onTap: () {},
          title: Text(
            "Help",
            style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  fontWeight: FontWeight.w500,
                ),
          ),
          leading: const Icon(
            Iconsax.support5,
            size: 25,
          ),
        ),
        ListTile(
          onTap: () {},
          title: Text(
            "Privacy Policy",
            style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  fontWeight: FontWeight.w500,
                ),
          ),
          leading: const Icon(
            Iconsax.back_square,
            size: 25,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          "V.1.0.1",
          style: Theme.of(context).textTheme.labelSmall,
        )
      ],
    );
  }
}
