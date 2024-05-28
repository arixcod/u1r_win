import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:u1r/commons/widgets/product/roundedcontainer.dart';
import 'package:u1r/features/auth/controllers/checkoutcontrollers.dart';
import 'package:u1r/features/shop/models/paymnetmethodmodel.dart';
import 'package:u1r/helpers/helper_functions.dart';
import 'package:u1r/utils/constatnts/colors.dart';
import 'package:u1r/utils/constatnts/sizes.dart';

class Tpaymenttile extends StatelessWidget {
  const Tpaymenttile({super.key, required this.paymentmethod});

  final PaymentMethodModel paymentmethod;

  @override
  Widget build(BuildContext context) {
    final controller=CheckoutController.instance;
  
    return ListTile(
      contentPadding: const EdgeInsets.all(0),
      onTap: () {
        controller.selectedpayemnt.value=paymentmethod;
        Get.back();
      },
      leading: TroundedConatiner(
        width: 60,
        height: 40,
        backgroundColor: THelperFunctions.isDarkMode(context)
            ? Tcolors.light
            : Tcolors.white,
        padding: const EdgeInsets.all(Tsizes.sm),
        child: Image(
          image: AssetImage(paymentmethod.image),
          fit: BoxFit.contain,
        ),
      ),
      title: Text(paymentmethod.name),
      trailing: Icon(Iconsax.arrow_right_34),
    );
  }
}
