import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:u1r/exceptions/firebase_exceptions.dart';
import 'package:u1r/exceptions/format_exceptions.dart';
import 'package:u1r/exceptions/platform_exceptions.dart';
import 'package:u1r/features/shop/models/category_model.dart';
import 'package:u1r/features/shop/models/subCategory_model.dart';

class subCategoryRepository extends GetxController {
    
     static subCategoryRepository get instance => Get.find();
  //variables

  final _db = FirebaseFirestore.instance;

  // Get all the Categories

  Future<List<subCategoryModel>> getAllsubCategories() async {
    try {
      final snapshot = await _db.collection('subCategories').get();
      
      final list = snapshot.docs
            .map((document) => subCategoryModel.fromSnapShot(document))
            .toList();
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
