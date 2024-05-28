import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:u1r/data/repos/auth_repo.dart';
import 'package:u1r/exceptions/firebase_exceptions.dart';
import 'package:u1r/exceptions/format_exceptions.dart';
import 'package:u1r/exceptions/platform_exceptions.dart';
import 'package:u1r/features/models/user_model.dart';

class UserRepo extends GetxController {
  static UserRepo get instance => Get.find();
  final _auth = FirebaseAuth.instance;

  final FirebaseFirestore _db = FirebaseFirestore.instance;

//to save the user data to firestore

  Future<void> saveuserRecord(UserModel user) async {
    try {
      await _db.collection("user-profile-data").doc(user.id).set(user.toJson());
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

  //this is new created 27th dec to fetch user data

  Future<UserModel> fetcheuserRecord() async {
    try {
      final snapshot = await _db
          .collection("user-profile-data")
          .doc(Authrepo.instance.authUser?.uid)
          .get();

      if (snapshot.exists) {
        return UserModel.fromSnapShot(snapshot);
      } else {
        return UserModel.empty();
      }
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

  // To update the data in the firestore databse

  Future<void> updateUserDetails(UserModel updatedUser) async {
    try {
      final snapshot = await _db
          .collection("user-profile-data")
          .doc(updatedUser.id)
          .update(updatedUser.toJson());
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

  // To update the single field of the user

  Future<void> updateSingleuserfield(Map<String, dynamic> json) async {
    try {
      await _db
          .collection("user-profile-data")
          .doc(Authrepo.instance.authUser?.uid)
          .update(json);
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

  // remove the User from the Database

  Future<void> deleteUser(String userid) async {
    try {
      await _db.collection("user-profile-data").doc(userid).delete();
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
