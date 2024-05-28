import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:u1r/commons/widgets/custom_appbar/custom_apbbar.dart';
import 'package:u1r/commons/widgets/primaryHeader/TprimaryHeader.dart';
import 'package:u1r/helpers/helper_functions.dart';

import '../../../../commons/widgets/custom shapes/customshapes/customshape.dart';
import '../../../../utils/constatnts/colors.dart';
import '../../../../utils/constatnts/sizes.dart';
import '../../../../utils/device/device_utility.dart';





class notificationsCentre extends StatelessWidget {
  const notificationsCentre({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: TcustomAppbar(
        showBackArrow: true,
        tittle:
        Text(
          'Notification Centre',
          style: Theme.of(context).textTheme.headlineMedium,
          ),
          actions:const [Icon(Iconsax.notification,color: Color.fromARGB(255, 176, 230, 159),)],
       ),
    
            body: 
            TprimaryHeader(
            color: Color.fromARGB(255, 116, 156, 104),
            hieght: THelperFunctions.screenHeight()-100,
            child: Stack(
              children: [
                        Positioned(
                        top: 100,
                        right: 300,
                        child: Tcircular(
                        backgroundColor: Tcolors.white.withOpacity(0.1)))
                        ,
                        Positioned(
                        top: 100,
                        bottom: 150,
                        left: 150,
                        child: Tcircular.circularSmall(
                          width: 40,
                          height: 40,
                          backgroundColor: Tcolors.white.withOpacity(0.1)))
         
              ],
            ))
    
    
    );
  }
}





