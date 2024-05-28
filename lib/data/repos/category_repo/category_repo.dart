import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:u1r/exceptions/firebase_exceptions.dart';
import 'package:u1r/exceptions/format_exceptions.dart';
import 'package:u1r/exceptions/platform_exceptions.dart';
import 'package:u1r/features/shop/models/category_model.dart';

class CategoryRepository extends GetxController {
  static CategoryRepository get instance => Get.find();
  //variables

  final _db = FirebaseFirestore.instance;

  // Get all the Categories
  Future<List<CategoryModel>> getAllCategories() async {
    try {
   
      final snapshot = await _db.collection('Categories').get();
      final list = snapshot.docs
          .map((document) => CategoryModel.fromSnapShot(document))
          .toList();
      return list;
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
}
