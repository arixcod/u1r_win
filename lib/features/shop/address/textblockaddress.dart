import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:u1r/features/shop/address/address_model.dart';
import 'package:u1r/features/shop/address/adress._controller.dart';

import '../../../commons/widgets/product/roundedcontainer.dart';
import '../../../helpers/helper_functions.dart';
import '../../../utils/constatnts/colors.dart';
import '../../../utils/constatnts/sizes.dart';

class Taddressblock extends StatelessWidget {
  const Taddressblock({
      super.key,
      required this.address,
      required this.onTap
  });
  
  
  
  final Addressmodel address;
  final VoidCallback onTap;
  
  
   
  @override
  Widget build(BuildContext context) {

    
    final controller=AddresController.instance;
    final dark = THelperFunctions.isDarkMode(context);
    return GestureDetector(
  
      onLongPress: () {
      
      },
      child: Obx(
        (){

          final selectedadressId=controller.selectedAddress.value.addreseId;
          final selectedadress=selectedadressId==address.addreseId;
          return InkWell(
          onTap: onTap,
          child: TroundedConatiner(
            padding: const EdgeInsets.all(Tsizes.md),
            width: double.infinity,
            showBorder: true,
            backgroundColor: selectedadress
                ? Tcolors.primaryColor.withOpacity(0.4)
                : Colors.transparent,
                borderColor: selectedadress
                ? Colors.transparent
                : dark
                    ? Tcolors.darkergrey
                    : Tcolors.grey,
            margin: const EdgeInsets.only(bottom: Tsizes.spacebtwnitems),
            child: Stack(
              children: [
                Positioned(
                  top: 0,
                  right: 5,
                  child: Icon(
                    selectedadress ? Iconsax.tick_circle5 : null,
                    color: selectedadress
                        ? dark
                            ? Tcolors.light
                            : Tcolors.dark
                        : null,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      address.name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    Text(
                      address.MobileNo,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    Text(
                      '${address.adresss}' +" , "+
                          '${address.city}' +","+
                          '${address.pinocde}' +","+
                          '${address.State}',
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.titleMedium,
                    )
                  ],
                )
              ],
            ),
          ),
        );
        }
      ),
    );
  }
}
