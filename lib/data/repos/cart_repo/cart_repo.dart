import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../../../exceptions/firebase_exceptions.dart';
import '../../../exceptions/format_exceptions.dart';
import '../../../exceptions/platform_exceptions.dart';
import '../auth_repo.dart';

class cartItemrepository extends GetxController {
  static cartItemrepository get instance => Get.find();

//initatilize firebase instance

  final _db = FirebaseFirestore.instance;

// Since cart is personlised for the User so its added in each-user-cartdata

  // To Add the cartItem to the cart

  Future<void> addtothecart(Map<String, dynamic> cartItems) async {
    try {
      final userID = Authrepo.instance.authUser!.uid;
      await _db.collection('user-carts').doc(userID).set(cartItems);
      //    return snapshot.docs.map((e) => ProductModel.fromSnapShot(e)).toList();
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

  

  // To get the cartItem to the from the Backend

  Future<void> fetchCart() async {
    try {} on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on TPlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (err) {
      //print(err);
      throw 'Something went worng';
    }
  }
}
