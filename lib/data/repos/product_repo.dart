import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:u1r/exceptions/format_exceptions.dart';
import 'package:u1r/exceptions/platform_exceptions.dart';
import 'package:u1r/features/shop/models/product_model.dart';

import '../../exceptions/firebase_exceptions.dart';
import '../../features/shop/models/grades_model.dart';
import '../../features/shop/models/weight_model.dart';

class ProductRepository extends GetxController {
  static ProductRepository get instance => Get.find();

  // firebase data

  final _db = FirebaseFirestore.instance;
  

  //get limited featured products

  Future<List<ProductModel>> getfeaturedproducts() async {
    try {
      final snapshot = await _db.collection('product_test31dec').limit(4).get();
      return snapshot.docs.map((e) => ProductModel.fromSnapShot(e)).toList();
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on TPlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (err) {
      throw 'Something went worng';
    }
  }

// Get the product Based on their product Id
Future<ProductModel> getproductviaProductId(String productId) async {
    try {
      final snapshot = await _db.collection('product_test31dec').doc(productId).get();
   
      Map<String, dynamic> data=snapshot.data() as Map<String, dynamic>;

     return ProductModel(
        isgraded: data['isgraded']??true,
        productname: data['title'] ?? '',
        photoUrl: data['imageurl'] ?? '',
        productId: snapshot.id,
        productCategory: data['categoryid'] ?? '',
        productSubcategory: data['subcategoryid'],
        productDetails: data['description'] ?? '',
        productPrice: data['salesprice'] ?? '',
        productWeight: data['weight'],
        grades: data['grades'] == [{}]
            ? [GradeModel.empty()]
            : (data['grades'] as List<dynamic>)
                .map((e) => GradeModel.fromJson(e))
                .toList(),
        weightOptions: data['weightoptions'] == [{}]
            ? []
            : (data['weightoptions'] as List<dynamic>)
                .map((e) => WeighteModel.fromJson(e))
                .toList(),
        Productactualprice: data['productprice'],

        //weightOptions:data['weight'] != null ? List<double>.from(data['weight']) : [],

        // To Convert json to list value
        variations: data['variation'],
        images: data['images'] != null ? List<String>.from(data['images']) : [],
        sku: data['sku'] ?? '',
        stock: data['stock'] ?? '0',
        brandName: data['brand'] ?? '');



        // return snapshot.docs.map((e) => ProductModel.fromSnapShot(e)).toList();
   
   
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on TPlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (err) {
     // print(err);
      throw 'Something went worng';
    }
  }


// get All the product In the Category 


Future<List<ProductModel>> getAllproductintheCategory() async {
    try {
      final snapshot = await _db.collection('product_test31dec').limit(100).get();
      return snapshot.docs.map((e) => ProductModel.fromSnapShot(e)).toList();
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on TPlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (err) {
     // print(err);
      throw 'Something went worng';
    }
  }


//get Alll the products featured products

  Future<List<ProductModel>> getallproductbyquerry(Query query) async {
    try {
      final snapshot = await query.get();
      final List <ProductModel>productlist=snapshot.docs.map((e) => ProductModel.fromSnapShot(e)).toList();
      return productlist;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on TPlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (err) {
   //   print(err);
      throw 'Something went worng';
    }
  }




//to get the selected fields fro  the database

  Future<ProductModel> getremianderproduct(String productId,) async {
    try {
     
     final res= await _db.collection('product_test31dec').doc(productId).get(GetOptions(source: Source.serverAndCache));
      
         
    return ProductModel.fromSnapShot(res);   
      
    
    }
    
     catch (err) {
      throw "failed retrieving one product detail ${err}";
    }
  }


  //get the favourite

  Future<List<ProductModel>> getfavouritesproducts(
      List<String> productIDs) async {
    try {
      final snapshot = await _db
          .collection('product_test31dec')
          .where(FieldPath.documentId, whereIn: productIDs)
          .get();
      return snapshot.docs.map((e) => ProductModel.fromSnapShot(e)).toList();
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on TPlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (err) {
      print(err);
      throw 'Something went worng';
    }
  }
}


