import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:u1r/exceptions/firebase_exceptions.dart';
import 'package:u1r/exceptions/format_exceptions.dart';
import 'package:u1r/exceptions/platform_exceptions.dart';
import 'package:u1r/features/shop/models/banner_model.dart';
import 'package:u1r/features/shop/models/category_model.dart';

class BannerRepository extends GetxController {
  static BannerRepository get instance => Get.find();
  
  //variables

  final _db = FirebaseFirestore.instance;

      // Get all the Categories
      Future<List<BannerModel>> getAllactivebanners() async {
    try {
      
       final result = await _db.collection('Banners').where('Active',isEqualTo: true).get();
        return result.docs.map((docs) =>BannerModel.fromSnapShot(docs) ).toList();     
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
