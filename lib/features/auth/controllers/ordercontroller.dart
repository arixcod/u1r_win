import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:u1r/data/repos/auth_repo.dart';
import 'package:u1r/features/auth/controllers/cart_controller.dart/cart_controller.dart';
import 'package:u1r/features/auth/controllers/checkoutcontrollers.dart';
import 'package:u1r/features/auth/screens/successscreen/orderplaced.dart';
import 'package:u1r/features/shop/address/addnewadres_controller.dart';
import 'package:u1r/features/shop/address/adress._controller.dart';
import 'package:u1r/features/shop/models/Ordermodel.dart';
import 'package:u1r/navigation_menu.dart';
import 'package:u1r/utils/constatnts/Image_strings.dart';
import 'package:u1r/utils/constatnts/enums.dart';
import 'package:u1r/utils/loader.dart';

import '../../../data/repos/orderrepo/Orderrepo.dart';

class OrderController extends GetxController {
  static OrderController get instance => Get.find();

  // Variables

  final cartcontroller = cartController.instance;
  final addadrescontroller = AddresController.instance;
  final checkoutcontroller = CheckoutController.instance;
  final orderRepo = Get.put(OrderReository());

// fetch user order history

  Future<List<OrderModel>> fetchuserorder() async {
    try {
      final userorder = await orderRepo.fetchallorders();
   
      return userorder;
    } catch (err) {
   
      return [];
    }
  }

// Method for proccesing the Order

  void processorder(double totalamount) async {
    try {
      //strat the loader

      TfullScreenloader.openLoadingDialouge(
          "Proccessign Your Order", TImages.dockerAnimation);
      //Get the user ID

      final userId = Authrepo.instance.authUser!.uid;

      if (userId.isNotEmpty) {
        //Add order details

        // Genrate the unique key for Each Order
        final order = OrderModel(
          UserId: userId,
          id: UniqueKey().toString(),
          status: OrderStatus.pending,
          orderDate: DateTime.now(),
          totalamount: totalamount,
          paymentmethod: checkoutcontroller.selectedpayemnt.value.name,
          adress: addadrescontroller.selectedAddress.value,

          //for the delivery date work is yet pending
          deliverydate: DateTime.now(),
          items: cartcontroller.cartItems.toList(),
        );

        // Here Save this order

        await orderRepo.saveorder(order, userId);
        //After Proceesing the order we clear the carts

        cartcontroller.clearCart();

        //Show succes screen after has succesfully created

        Get.off(() => OrderSuccesScreen(
              image: TImages.onboardingImage2,
              title: 'Order Placed Succesfully!',
              subtitle: 'Order Will be Shipped soon',
              onPressed: () => Get.offAll(() =>  NavigationMenu()),
            ));
      }
    } catch (err) {}
  }
}
