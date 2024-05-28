import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:u1r/commons/widgets/custom_appbar/custom_apbbar.dart';
import 'package:u1r/features/auth/controllers/login/logincontroller.dart';
import 'package:u1r/features/personilaztion/Screens/changeuserinfo/changeName.dart';
import 'package:u1r/features/personilaztion/Screens/reauthuser.dart';
import 'package:u1r/utils/constatnts/sizes.dart';

import '../../../commons/widgets/shimmer/shimmer.dart';
import '../../../utils/constatnts/colors.dart';
import '../../auth/controllers/user_profile_controller.dart';
import '../../models/user_model.dart';
import '../profile/widget/profileeditablewidget.dart';

class UserprofileScreen extends StatelessWidget {
  const UserprofileScreen({super.key, required this.user});

  final Rx<UserModel>? user;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserProfileController());

    final logincontroller =Get.put(loginController());

    return Scaffold(
      appBar: TcustomAppbar(
        showBackArrow: true,
        tittle: Text(
          'Profile',
          style: Theme.of(context)
              .textTheme
              .headlineMedium!
              .copyWith(color: Tcolors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(Tsizes.defaultspacing),
          child: Column(
            children: [
              //default placeholder Image for the app
              SizedBox(
                width: double.infinity,
                child: Obx(() {
                  final userdata = user!.value;

                  if (controller.isloading.value) {
                    return const TShimmerWidget(width: 80, height: 15);
                  } else {
                    return Column(
                      children: [
                        const CircleAvatar(
                          backgroundImage: AssetImage(
                              "assets/images/category_images/default-avatar.png"),
                          radius: 40,
                        ),
                        const SizedBox(
                          height: Tsizes.spacebtwnitems,
                        ),
                        Text(
                          "Edit/Change Your Profile",
                          style: Theme.of(context)
                              .textTheme
                              .labelMedium!
                              .copyWith(
                                  fontWeight: FontWeight.w500,
                                  color: Tcolors.darkergrey),
                        ),
                        const SizedBox(
                          height: Tsizes.spacebtwnitems,
                        ),
                        const Divider(),
                        const SizedBox(
                          height: Tsizes.spacebtwnitems,
                        ),
                        Text(
                          "Profile Info",
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                        const SizedBox(
                          height: Tsizes.spacebtwnitems,
                        ),
                        profileediatbalewidget(
                          title: "Name",
                          value: user!.value.first + ' ' + user!.value.last,
                          onpressed: () {},
                        ),
                        profileediatbalewidget(
                          title: 'Email',
                          value: user!.value.email,
                          onpressed: () {},
                        ),
                        const SizedBox(
                          height: Tsizes.spacebtwnitems,
                        ),
                        const Divider(),
                        const SizedBox(
                          height: Tsizes.spacebtwnitems,
                        ),
                        Text(
                          "Bussiness Info",
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                        const SizedBox(
                          height: Tsizes.spacebtwnitems,
                        ),
                        profileediatbalewidget(
                          title: 'Address',
                          value: user!.value.adress,
                          onpressed: () {},
                        ),
                        profileediatbalewidget(
                          title: 'GST No.',
                          value: user!.value.gstNumber,
                          onpressed: () {},
                        ),
                        const Divider(),
                        const SizedBox(
                          height: Tsizes.spacebtwnitems,
                        ),
                       
                        Center(
                          child: OutlinedButton(
                              
                            style: ElevatedButton.styleFrom(
                                side: BorderSide(

                                    color: Tcolors.primaryColorbtnshade)),
                            child: Text('logout',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall!
                                    .copyWith(
                                        fontWeight: FontWeight.w500,
                                        color: Tcolors.warning)),
                                onPressed: () async {
                            
                              //logging out the user
                                loginController.instance.logoutuser();
                              
                              
                              },
                          ),
                        ),
                        const SizedBox(
                          height: Tsizes.spacebtwnitems,
                        ),
                       

                        Center(
                          child: OutlinedButton(
                            style: ElevatedButton.styleFrom(
                                side: BorderSide(
                                    color: Tcolors.primaryColorbtnshade)),
                            child: Text('Edit Profile',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall!
                                    .copyWith(
                                        fontWeight: FontWeight.w500,
                                        color: Tcolors.primaryColorbtnshade)),
                            onPressed: () {
                              Get.off(() => const ChangeName(),
                                  transition: Transition.fadeIn);
                            },
                          ),
                        ),
                        const SizedBox(
                          height: Tsizes.spacebtwnitems,
                        ),
                       
                       
                       
                        Center(
                          child: TextButton(
                            child: Text(
                              "Delete Account",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .copyWith(
                                      fontWeight: FontWeight.w500,
                                      color: Tcolors.error),
                            ),
                            onPressed: () {
                              controller.getdefaultdailouge();
                            },
                          ),
                        )
                      ],
                    );
                  }
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
