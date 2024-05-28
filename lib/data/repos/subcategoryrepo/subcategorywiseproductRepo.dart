import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:u1r/exceptions/firebase_exceptions.dart';
import 'package:u1r/exceptions/format_exceptions.dart';
import 'package:u1r/exceptions/platform_exceptions.dart';
import 'package:u1r/features/shop/models/category_model.dart';
import 'package:u1r/features/shop/models/product_model.dart';
import 'package:u1r/features/shop/models/subCategory_model.dart';

class subCategorywiseproductRepository extends GetxController {
  static subCategorywiseproductRepository get instance => Get.find();

  //variables

  final _db = FirebaseFirestore.instance;

  // Get all the Categories

  Future<List<ProductModel>> getAllsubCategorieswiseproduct(
      String subcategoryID) async {
    try {
      final snapshot = await _db
          .collection('product_test31dec')
          .where("subcategoryid", isEqualTo: subcategoryID)
          .get();
      final list = snapshot.docs
          .map((document) => ProductModel.fromSnapShot(document))
          .toList();

    //  print(subcategoryID);
      return list;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on TPlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (err) {
      rethrow;
    }
  }
}
