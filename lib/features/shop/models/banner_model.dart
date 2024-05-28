import 'package:cloud_firestore/cloud_firestore.dart';

class BannerModel {
    String imgUrl;
    final String targetScreen;
    final bool isAcitve;

  BannerModel({
    required this.imgUrl,
    required this.targetScreen,
    required this.isAcitve,
  });

  Map<String, dynamic> toJson() {
    return {'imgurl': imgUrl, 'targetScren': targetScreen, 'active': isAcitve};
  }

  factory BannerModel.fromSnapShot(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>;
    return BannerModel(
        imgUrl: data['Imageurl'] ?? '',
        targetScreen: data['TargetScreen'] ?? '',
        isAcitve: data['Active'] ?? false);
  }
}
