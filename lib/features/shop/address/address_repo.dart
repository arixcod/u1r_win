import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:u1r/data/repos/auth_repo.dart';
import 'package:u1r/exceptions/firebase_exceptions.dart';
import 'package:u1r/exceptions/format_exceptions.dart';
import 'package:u1r/exceptions/platform_exceptions.dart';
import 'package:u1r/features/shop/address/address_model.dart';

class AddressRepository extends GetxController {
  static AddressRepository get instance => Get.find();

  //variables

  final _db = FirebaseFirestore.instance;

  //get the instance of looged in user
  final _auth = FirebaseAuth.instance;

  //get the authinticated user

  User? get authUser => _auth.currentUser;

  // Get all the adresses saved by user
  Future<List<Addressmodel>> getAlladresses() async {
    try {
      final result = await _db
          .collection('user-profile-data')
          .doc(authUser!.uid)
          .collection('address')
          .get();
      return result.docs
          .map((docs) => Addressmodel.fromSnapShot(docs))
          .toList();
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

  //save an adress to the database
  Future<void> addadress(Map<String, dynamic> address) async {
    try {
      await _db
          .collection('user-profile-data')
          .doc(authUser!.uid)
          .collection('address')
          .add(address);
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

  //update the address

  Future<List<Addressmodel>> updateadress() async {
    try {
      final result = await _db
          .collection('Banners')
          .where('Active', isEqualTo: true)
          .get();
      return result.docs
          .map((docs) => Addressmodel.fromSnapShot(docs))
          .toList();
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

//update single field of the adress for primary address selection

  Future<void> updateselectedField(String adresessid, bool selected) async {
    try {
      final userID = Authrepo.instance.authUser!.uid;
      await _db
          .collection('user-profile-data')
          .doc(userID)
          .collection('address')
          .doc(adresessid)
          .update({'isPrimary': selected});
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on TPlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (err) {
      throw 'Unable to change your adress prefrence';
    }
  }

//get the primary selected Adress

  Future<List<Addressmodel>> getPrimaryAdress() async {
    try {
      final userID = Authrepo.instance.authUser!.uid;
      final res = await _db
          .collection('user-profile-data')
          .doc(userID)
          .collection('address')
          .where('isPrimary', isEqualTo: true)
          .get();

      return res.docs.map((doc) => Addressmodel.fromSnapShot(doc)).toList();
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on TPlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (err) {
      throw 'Unable to change your adress prefrence';
    }
  }

//delete the address

  Future<List<Addressmodel>> deleteaddress() async {
    try {
      final result = await _db
          .collection('Banners')
          .where('Active', isEqualTo: true)
          .get();
      return result.docs
          .map((docs) => Addressmodel.fromSnapShot(docs))
          .toList();
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
