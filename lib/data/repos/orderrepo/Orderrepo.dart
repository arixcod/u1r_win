import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:u1r/data/repos/auth_repo.dart';
import 'package:u1r/features/shop/models/Ordermodel.dart';

class OrderReository extends GetxController {
  static OrderReository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  //Get all the user orders
  Future<List<OrderModel>> fetchallorders() async {
    try {
      final userID = Authrepo.instance.authUser!.uid;
      if (userID.isNotEmpty) {
        final results = await _db
            .collection('user-profile-data')
            .doc(userID)
            .collection('Orders')
            .get();    
        return results.docs.map((doc) => OrderModel.fromsnashopt(doc)).toList();
      } else {
        throw "User not Available";
      }
    } catch (err) {
      throw 'Something went wrong  with : ${err}';
    }
  }

//Create the new user order
  Future<void> saveorder(OrderModel order, String UserId) async {
    try {
      await _db
          .collection('user-profile-data')
          .doc(UserId)
          .collection('Orders')
          .add(order.toJson());
    } catch (err) {
      throw 'Something went wrong with ${err} while placing the order';
    }
  }
}
