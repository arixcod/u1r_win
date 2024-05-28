import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:u1r/features/shop/address/add_address.dart';
import 'package:u1r/features/shop/address/address_model.dart';
import 'package:u1r/features/shop/address/address_repo.dart';
import 'package:u1r/features/shop/address/textblockaddress.dart';
import 'package:u1r/helpers/cloud_helper_functions.dart';
import 'package:u1r/utils/constatnts/colors.dart';
import 'package:u1r/utils/constatnts/sizes.dart';

class AddresController extends GetxController {
  static AddresController get instance => Get.find();

  final Rx<Addressmodel> selectedAddress = (Addressmodel.empty()).obs;
  final adresRepository = Get.put(AddressRepository());
  final isLoading = false.obs;
  GlobalKey<FormState> addadresskey =
      GlobalKey<FormState>(); //form key for form validation
  //variables

  RxList<Addressmodel> Primaryadress = <Addressmodel>[].obs;
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final email = TextEditingController();
  final adressLine1 = TextEditingController();
  final landmark = TextEditingController();
  final pincode = TextEditingController();
  final city = TextEditingController();
  final state = TextEditingController();

  // fetch adrrss to be  displayed

 

  Future<List<Addressmodel>> fetchfalladress() async {
 
    try {
      //set the loader

      isLoading.value = true;

      final adresess = await adresRepository.getAlladresses();
      selectedAddress.value = adresess.firstWhere(
          (element) => element.isPrimary,
          orElse: () => Addressmodel.empty());

      isLoading.value = false;

      return adresess;
    } catch (err) {
      return [];
    } finally {
      isLoading.value = false;
    }
  }

  Future selectnewaddress(Addressmodel newSelectedadres) async {
    try {
      Get.defaultDialog(
          title: '',
          onWillPop: () async {
            return false;
          },
          barrierDismissible: false,
          backgroundColor: Colors.transparent,
          content: const CircularProgressIndicator());

      if (selectedAddress.value.addreseId.isNotEmpty) {
        await adresRepository.updateselectedField(
            selectedAddress.value.addreseId, false);
      }
      //assign the selected;
      //   newSelectedadres.selectedadress = true;

      newSelectedadres.isPrimary = true;
      selectedAddress.value = newSelectedadres;

      await adresRepository.updateselectedField(
          selectedAddress.value.addreseId, true);
      Get.back();
    } catch (err) {}
  }

  void saveadress() {}

  @override
  void onInit() {
    //get the Primary Adress
    getPrimarySelectedadress();

    super.onInit();
  }
  

  Future<void> getPrimarySelectedadress() async {
    final res = await adresRepository.getPrimaryAdress();
    Primaryadress.assignAll(res);
    
    if(res.isNotEmpty){
      selectedAddress.value=res.first;
      print("not Empty ");
 
    }
    }

  //show modal bottomsheet for the address selection

  Future<dynamic> selectNewAdresspopup(BuildContext context) {
    return showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            padding: EdgeInsets.all(Tsizes.lg),
            child: Column(
              children: [
                Text('Select Delivery Address'),
                const SizedBox(
                  height: Tsizes.spacebtwnitems,
                ),
                FutureBuilder(
                    future: fetchfalladress(),
                    builder: (_, snapshot) {
                      final response =
                          TCloudHelperFunctions.checkMultiRecordState(
                              snapshot: snapshot);
                      if (response != null) return response;
                      return ListView.builder(
                          shrinkWrap: true,
                          itemCount: snapshot.data!.length,
                          itemBuilder: (_, index) {
                            return Taddressblock(
                                address: snapshot.data![index],
                                onTap: () async {
                                  await selectnewaddress(snapshot.data![index]);
                                  Get.back();
                                });
                          });
                    }),
                const SizedBox(
                  height: 10,
                ),
                Container(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Tcolors.primaryColorbtnshade,
                          side: BorderSide.none),
                      onPressed: () => Get.to(() => addAddresscreen()),
                      child: Text("Add new  Address"),
                    ))
              ],
            ),
          );
        });
  }
}
