import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class Addressmodel {
  final String name;
  final String MobileNo;
  bool isPrimary;
  final String adresss;
  final String pinocde;
  final String city;
  final String State;
  final String landmark;
  final String email;
  final String addreseId;

  Addressmodel(
      {required this.addreseId,
      required this.email,
      required this.name,
      required this.MobileNo,
      required this.isPrimary,
      required this.adresss,
      required this.pinocde,
      required this.city,
      required this.State,
      required this.landmark});

  static Addressmodel empty() => Addressmodel(
      name: "",
      MobileNo: "",
      isPrimary: false,
      adresss: "",
      pinocde: "",
      city: "",
      State: "",
      landmark: "",
      addreseId: "",
      email: "");

  Map<String, dynamic> toJson() {
    return {
      "name": name.trim(),
      "MobileNo": MobileNo,
      "isPrimary": isPrimary,
      "adresss": adresss,
      "pinocde": pinocde,
      "city": city,
      "State": State,
      "landmark": landmark,
      "emaill": email
    };
  }

  //Only use it for "map model" to fetch orders

  factory Addressmodel.fromMap(Map<String, dynamic> map) {
    return Addressmodel(
        addreseId: map['addreseId']??'',
        email: map['emaill']??'',
        name: map['name']??'',
        MobileNo: map['MobileNo']??'',
        isPrimary: map['isPrimary']??false,
        adresss: map['adresss']??'',
        pinocde: map['pinocde']??"",
        city: map['city']??"",
        State: map['State']??'',
        landmark: map['landmark']??''
        
        );
  }

  factory Addressmodel.fromSnapShot(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>;
    return Addressmodel(
        addreseId: snapshot.id,
        email: data['email'],
        name: data['name'],
        MobileNo: data['MobileNo'],
        State: data['State'],
        isPrimary: data['isPrimary'],
        adresss: data['adress'],
        pinocde: data['pincode'],
        city: data['city'],
        landmark: data['landmark']);
  }
}
