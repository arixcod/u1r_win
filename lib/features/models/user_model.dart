import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String id;
   String first;
   String last;
   String email;
   String gstNumber;
   String adress;
  final String landmark;
  final String pincode;
  final String city;
  final String state;

   UserModel({
    required this.id,
    required this.first,
    required this.last,
    required this.email,
    required this.gstNumber,
    required this.adress,
    required this.landmark,
    required this.pincode,
    required this.city,
    required this.state,
  });

  //  constructor for empty user model

  static UserModel empty() =>  UserModel(
      id: '',
      first: '',
      last: '',
      email: '',
      gstNumber: '',
      adress: '',
      landmark: '',
      pincode: '',
      city: '',
      state: '');

  //convert user Model to Json

  Map<String, dynamic> toJson() {
    return {
      'first': first,
      'last': last,
      'email': email,
      'gstNumber': gstNumber,
      'adress': adress,
      'landmark': landmark,
      'pincode': pincode,
      'city': city,
      'state': state,
    };
  }

  // Factory Method to create JSon data from firebase snapshot

  factory UserModel.fromSnapShot(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>;
    return UserModel(
        id: snapshot.id,
        first: data['first']??'',
        last: data['last'] ?? '',
        email: data['email'] ?? '',
        gstNumber: data['gstNumber'] ?? '',
        adress: data['adress'] ?? '',
        landmark: data['landmark'] ?? '',
        pincode: data['pincode'] ?? '',
        city: data['city'] ?? '',
        state: data['state']??'',);
  }
}
