import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:u1r/features/shop/models/grades_model.dart';
import 'package:u1r/features/shop/models/weight_model.dart';

class ProductModel {
  //for product name & image

  final String productname; //
  final String photoUrl; //
  final List<String> images; //
  final String productDetails;
  final String brandName; //
  String Productactualprice;
  final bool isgraded;

  //for product relational map with categories and subcategory

  final String productId;
  final String productCategory;
  final String productSubcategory;
  final String variations;
  //for the stokc keeping
  final String sku;
  final String stock;
  //more product details
  final String productPrice;
  final List<GradeModel> grades;
  final String productWeight;
  final List<WeighteModel> weightOptions;

  ProductModel(
      {required this.isgraded,
      required this.Productactualprice,
      required this.variations,
      required this.productname,
      required this.photoUrl,
      required this.productId,
      required this.productCategory,
      required this.productSubcategory,
      required this.productDetails,
      required this.grades,
      required this.weightOptions,
      required this.productPrice,
      required this.productWeight,
      required this.images,
      required this.sku,
      required this.stock,
      required this.brandName});

  // empty product model to return if no data is found
  static ProductModel empty() => ProductModel(
      productname: '',
      photoUrl: '',
      productId: '',
      productCategory: '',
      productSubcategory: '',
      productDetails: '',
      grades: [],
      weightOptions: [],
      productPrice: '0.0',
      productWeight: '0.0',
      images: [],
      sku: '',
      stock: '0',
      brandName: '',
      variations: '',
      isgraded: false,
      Productactualprice: '0');

  //from Json to product model

  factory ProductModel.fromJSon(Map<String, dynamic> json) {
    return ProductModel(
        productname: json['title'] ?? '',
        photoUrl: json['imageurl'] ?? '',
        productId: json['_id'] ?? '',
        productCategory: json['categoryid'] ?? '',
        productSubcategory: json['subcategoryid'] ?? '',
        productDetails: json['description'] ?? '',
        productPrice: json['salesprice'] ?? '',
        productWeight: json['weight'] ?? '',
        grades: (json['grades'] as List<dynamic>)
            .map((e) => GradeModel.fromJson(e))
            .toList(),
        weightOptions: (json['weightoptions'] as List<dynamic>)
            .map((e) => WeighteModel.fromJson(e))
            .toList(),
        Productactualprice: json['productprice'] ?? '',

        // This is temporarily turned true date Jan 14

        isgraded: json['isgraded']??true,
        //weightOptions:json['weight'] != null ? List<double>.from(json['weight']) : [],

        // To Convert json to list value
        variations: json['variation'] ?? '',
        images: json['images'] != null ? List<String>.from(json['images']) : [],
        sku: json['sku'] ?? '',
        stock: json['stock'] ?? '0',
        brandName: json['brand'] ?? '');
  }

  factory ProductModel.fromSnapShot(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>;
    return ProductModel(
        isgraded: data['isgraded']??true,
        productname: data['title'] ?? '',
        photoUrl: data['imageurl'] ?? '',
        productId: snapshot.id,
        productCategory: data['categoryid'] ?? '',
        productSubcategory: data['subcategoryid'],
        productDetails: data['description'] ?? '',
        productPrice: data['salesprice'] ?? '',
        productWeight: data['weight'],
        grades: data['grades'] == [{}]
            ? [GradeModel.empty()]
            : (data['grades'] as List<dynamic>)
                .map((e) => GradeModel.fromJson(e))
                .toList(),
        weightOptions: data['weightoptions'] == [{}]
            ? []
            : (data['weightoptions'] as List<dynamic>)
                .map((e) => WeighteModel.fromJson(e))
                .toList(),
        Productactualprice: data['productprice'],

        //weightOptions:data['weight'] != null ? List<double>.from(data['weight']) : [],

        // To Convert json to list value
        variations: data['variation'],
        images: data['images'] != null ? List<String>.from(data['images']) : [],
        sku: data['sku'] ?? '',
        stock: data['stock'] ?? '0',
        brandName: data['brand'] ?? '');
  }
}
