import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:u1r/features/shop/models/grades_model.dart';

class GradeModel {
  GradeModel(
      {required this.salesPrice,
      required this.grade,
      required this.count,
      required this.price});

  final String grade;
  final String count;
  final String price;
  final String salesPrice;

  // empty product model to return if no data is found
  static GradeModel empty() =>GradeModel(grade: '', price: '0', count: '', salesPrice: '0');

  
  Map<String, dynamic> toMap() {
    return {
        "grade":grade,
        "price":price,
        "count":count,
        "salesPrice":salesPrice
       };
  }

  factory GradeModel.fromJson(Map<String, dynamic> data1) {
    final data = data1;
    return GradeModel(
        grade: data['grade'] ?? '',
        count: data['count'] ?? '',
        price: data['price'] ?? '',
        salesPrice: data['Salesprice']??''
        );
  }
}
