import 'package:cloud_firestore/cloud_firestore.dart';

class CartModel {
  String productID;
  String productName;
  String productprice;
  Map<String, dynamic>?
      selectedgrade; //we will use grade model to display grades of the data
  Map<String, dynamic>?
      selecteweight; //we will use grade model to display weight of the data
  String brand;
  String variations; //for the type if available e.g kollam & manglore
  double productQuantity;
  String thumbImage;
  String productweight;

  CartModel({
    required this.productweight,
    required this.thumbImage,
    required this.productQuantity,
    required this.productID,
    required this.productName,
    required this.productprice,
    required this.selectedgrade,
    required this.selecteweight,
    required this.brand,
    required this.variations,
  });

  // Map used to upload data to the firebase

  Map<String, dynamic> toMap() {
    return {

      'productID': productID,
      'productName': productName,
      'productprice': productprice,
      'selectedgrade': selectedgrade,
      'selecteweight': selecteweight,
      'brand': brand,
      'variations': variations,
      'productQuantity':
          productQuantity, //for the type if available e.g kollam & manglore
      'thumbImage': thumbImage,
      'productweight':productweight
    };
  }

  // Copy constructor for updating quantity

  //   CartModel copyWith(double? quantity) {
  //   return CartModel(
  //       productQuantity: quantity ?? this.productQuantity,
  //       productID: this.productID,
  //       productName: this.productName,
  //       productprice: this.productprice,
  //       selectedgrade: this.selectedgrade,
  //       selecteweight: this.selecteweight,
  //       brand: this.brand,
  //       variations: this.variations,
  //       thumbImage: this.thumbImage);
  //
  // }

  // Empty cart model

  static CartModel empty() => CartModel(
      thumbImage: '',
      productQuantity: 0.0,
      productID: "",
      productName: "",
      productprice: "",
      selectedgrade: {},
      selecteweight: {},
      brand: "",
      variations: "",
      productweight: "");

  factory CartModel.fromMap(Map<String, dynamic> map) {
    return CartModel(
      thumbImage: map['thumbImage'],
      productQuantity: map['productQuantity'] ?? 0.0,
      productID: map['productID'] ?? "",
      productName: map['productName'] ?? "",
      productprice: map['productprice'] ?? "",
      selectedgrade: map['selectedgrade'] ?? <String, dynamic>{},
      selecteweight: map['selecteweight'] ?? <String, dynamic>{},
      brand: map['brand'] ?? "",
      variations: map['variations'] ?? "",
      productweight: map['productweight']
    );
  }

  //to download the data from the cloud
  factory CartModel.fromSnapShot(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>;
    return CartModel(
        productID: data['productID'],
        productName: data['productName'],
        productprice: data['productprice'],
        selectedgrade: data['selectedgrade'],
        selecteweight: data['selecteweight'],
        brand: data['brand'],
        variations: data['variations'],
        productQuantity: data['productQuantity'],
        thumbImage: data['thumbImage'],
        productweight: data['productweight']
        
        );
  }
}
