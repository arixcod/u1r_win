import 'package:cloud_firestore/cloud_firestore.dart';

class CategoryModel {
  String id;
  String name;
  String image;
  bool isFeatured;
  String parentID;

  CategoryModel(
      {required this.id,
      required this.image,
      required this.name,
      required this.isFeatured,
      this.parentID = ''});

  //empty()

  static CategoryModel empty() =>
      CategoryModel(id: '', image: '', name: '', isFeatured: false);

  //Convert Model to Json

  Map<String, dynamic> toJson() {
        return {
            "Name": name,
            "Image": image,
            "ParentId": parentID,
            "isFeatured": isFeatured
    };
  }

//get data from the firebase and return into Json format
  factory CategoryModel.fromSnapShot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      final data = document.data()!;
      //  print(data);
      //Map Json records to the modle

      return CategoryModel(
          id: document.id,
          image: data['Image'] ?? '',
          name: data['Name'] ?? '',
          isFeatured: data['isFeatured'] ?? false);
    }     else {
      return CategoryModel.empty();
    }
  }
}
