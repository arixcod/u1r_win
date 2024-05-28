import 'package:cloud_firestore/cloud_firestore.dart';

class subCategoryModel {
  final String imgUrl;
  final String Altername;
  final String Name;
  final String ParentId;
  final bool isFeatured;
  final String SubaCategoryId;
 
  subCategoryModel({
    required this.Altername,
    required this.Name,
    required this.imgUrl,
    required this.ParentId,
    required this.isFeatured,
    required this.SubaCategoryId
  });

  Map<String, dynamic> toJson() {
    return {
      'Name': Name,
      'Altername': Altername,
      'isFeatured': isFeatured,
      'imgUrl': imgUrl,
      'ParentId': ParentId, 
    };
  }

  factory subCategoryModel.fromSnapShot(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>;
    return subCategoryModel(
        SubaCategoryId: snapshot.id,
        Altername: data['Altername'],
        Name: data['Name'],
        imgUrl: data['Image'],
        ParentId: data['ParentId'],
        isFeatured: data['isFeatured']);
  }
}
