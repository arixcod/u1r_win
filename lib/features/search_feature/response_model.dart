import 'package:u1r/features/shop/models/product_model.dart';

class searchResponseModel {
  final List<ProductModel> searchresponse;

  searchResponseModel({
    required this.searchresponse,
  });

  factory searchResponseModel.fromJson(Map<String, dynamic> json) {
    return searchResponseModel(
        searchresponse: (json['results'] as List<dynamic>)
            .map((e) => ProductModel.fromJSon(e))
            .toList());
  }
}
