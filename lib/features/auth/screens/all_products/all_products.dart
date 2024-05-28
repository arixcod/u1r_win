import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:u1r/commons/widgets/custom_appbar/custom_apbbar.dart';
import 'package:u1r/commons/widgets/shimmer/Tverticleproductshimmer.dart';
import 'package:u1r/features/auth/screens/all_products/Tsoratbleproducts.dart';
import 'package:u1r/features/shop/models/product_model.dart';
import 'package:u1r/helpers/cloud_helper_functions.dart';
import 'package:u1r/utils/constatnts/sizes.dart';

import '../../../shop/controllers/allproductController.dart';

class allproducts extends StatelessWidget {
  const allproducts(
      {super.key, required this.title, this.query, this.futuremethod});

  final String title;
  final Query? query;
  final Future<List<ProductModel>>? futuremethod;

  @override
  Widget build(BuildContext context) {
    //
    final controller = Get.put(AllProductController());
    return Scaffold(
      appBar: TcustomAppbar(
        showBackArrow: true,
        tittle: Text("All Products"),
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding: EdgeInsets.all(Tsizes.spacebtwnitems),
        child: FutureBuilder(
            future: futuremethod ?? controller.fetchProductByquery(query),
            builder: (context, snapshot) {
              //start the loader

              const loader = Tverticalproductshimmer();
             
             final widget=TCloudHelperFunctions.checkMultiRecordState(snapshot: snapshot,loader: loader);

                if(widget!=null) return widget;
              //here we have products

              final products = snapshot.data!;

              return TsoratbleProducts(
                products: products,
              );
            }),
      )),
    );
  }
}
