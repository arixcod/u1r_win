import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:u1r/commons/widgets/paymenttile/tpaymenttile.dart';
import 'package:u1r/utils/constatnts/Image_strings.dart';
import 'package:u1r/utils/constatnts/enums.dart';
import 'package:u1r/utils/constatnts/sizes.dart';

import '../../shop/models/paymnetmethodmodel.dart';

class CheckoutController extends GetxController{

  static CheckoutController get instance=>Get.find();

  
  final Rx<PaymentMethodModel> selectedpayemnt=PaymentMethodModel.empty().obs;
  final RxDouble totalcost_to_customer=0.0.obs;

        CheckoutController({
            required this.shpping_cost,
            required this.tax,
            required this.subtotal
        });

        double subtotal;
        double tax;
        double shpping_cost;

  @override
  void onInit() {
    Calculatetotalcost(subtotal, tax, shpping_cost);
    selectedpayemnt.value=PaymentMethodModel(name: 'Gpay',image: TImages.google);
    super.onInit();
  }




double Calculatetotalcost(double subtotal,double tax,double shpping_cost){
            totalcost_to_customer.value=subtotal+tax+shpping_cost;
            print(totalcost_to_customer.value);
          return subtotal+tax+shpping_cost;

}


Future <dynamic>selectpyamnetmethod(BuildContext context){
  return showModalBottomSheet(context: context, 
  builder:(context){

    return SingleChildScrollView(

      child: Container(
        padding: const EdgeInsets.all(Tsizes.lg),
        child:Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
              Text('Select Payment Method'),
              SizedBox(height: Tsizes.spacebtwnitems,),
              Tpaymenttile(paymentmethod: PaymentMethodModel(name: 'Gpay', image: TImages.google),)
           
            , SizedBox(height: Tsizes.spacebtwnitems,),
              Tpaymenttile(paymentmethod: PaymentMethodModel(name: 'Phonepe', image: TImages.phonepe),)

            , SizedBox(height: Tsizes.spacebtwnitems,),
              Tpaymenttile(paymentmethod: PaymentMethodModel(name: 'Paytm', image: TImages.paytm),),
           
            ],
        ) ),
    );
  });

}

}