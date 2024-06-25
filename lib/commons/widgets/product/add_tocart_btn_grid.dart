import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:u1r/features/auth/controllers/cart_controller.dart/cart_controller.dart';
import 'package:u1r/features/shop/models/product_model.dart';
import 'package:u1r/features/shop/productdetails/productdetails.dart';
import '../../../utils/constatnts/colors.dart';

class addtocartbtnongrid extends StatelessWidget {
  const addtocartbtnongrid({required this.product, super.key});
  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    final controller = cartController.instance;

    return GestureDetector(
      onTap: () {
        
        // If product is garded then show the grades

        // Else directly add to the cart

        if (product.isgraded == 'false') {
          final cartItem = controller.converttocartItem(product, 1);
          controller.addOneitemtocart(cartItem);
        } else {
         
           // Go to the product details screen

          Get.to(() => Productdetailcreen(product: product));
        }
      },
      child: Obx(() {
        final productQuantityinCart =
        controller.getproductQuantityinCart(product.productId);

        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 35,
            width: 35,
            decoration: BoxDecoration(
                color: productQuantityinCart > 0
                    ? Tcolors.primaryColor
                    : Tcolors.primaryColorbtnshade,
                borderRadius: BorderRadius.circular(10)),
                child: productQuantityinCart > 0
                ? Center(
                  child: Text(productQuantityinCart.toString(),textAlign: TextAlign.center,style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      fontSize: 15,
                        fontWeight: FontWeight.w600,
                       color: Tcolors.white
                    ),
                  ),
                )
                : Icon(
                    Icons.add,
                    color: Tcolors.white,
                    size: 20,
                  ),
          ),
        );
      }),
    );
  }
}
