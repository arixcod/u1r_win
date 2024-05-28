import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:u1r/commons/widgets/custom_appbar/custom_apbbar.dart';
import 'package:u1r/commons/widgets/shimmer/shimmer.dart';
import 'package:u1r/features/shop/address/addnewadres_controller.dart';
import 'package:u1r/features/shop/address/adress._controller.dart';
import 'package:u1r/features/shop/address/textblockaddress.dart';
import 'package:u1r/helpers/cloud_helper_functions.dart';
import 'package:u1r/utils/constatnts/sizes.dart';

import '../../../utils/constatnts/colors.dart';
import 'add_address.dart';

class Addresscreen extends StatelessWidget {
  const Addresscreen({super.key});
  final bool isPrimaryaddress = true;

  @override
  Widget build(BuildContext context) {
    

    final controller=  Get.put(AddresController());
    final adnewadresscontroller=Get.put(addadress());
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Tcolors.primaryColor,
        onPressed: () {
          // go to the
          Get.to(() => addAddresscreen());
        },
        child: const Icon(
          Iconsax.add,
          color: Tcolors.white,
        ),
      ),
      appBar: TcustomAppbar(
        showBackArrow: true,
        tittle: Text(
          'Addresses',
          style: Theme.of(context).textTheme.headlineMedium!.copyWith(
            color: Tcolors.white
          ),
        ),
      ),
      body:SingleChildScrollView(
            child: Padding(padding: const EdgeInsets.all(20),child: 
            
            
            Obx(
            () {
            return  FutureBuilder(
                key: Key(adnewadresscontroller.refreshdata.value.toString()),
                future: controller.fetchfalladress(),
                builder: (context, snapshot) {
                  final response=TCloudHelperFunctions.checkMultiRecordState(snapshot: snapshot);
                  if (response!=null) return response;
                    final addresses=snapshot.data!;
            
                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: addresses.length,
                      itemBuilder: (_,index){
                        return 
                       Taddressblock(
                        address: addresses[index],
                        onTap: () {
                          controller.selectnewaddress(addresses[index]);
                        },
                       );
                
                      },
              );}
              );
             }
            )
            ),

                       
      ) 
     
    );
  }
}
