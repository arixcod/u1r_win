import 'package:get/get.dart';

import '../../shop/models/grades_model.dart';
import '../../shop/models/product_model.dart';

class ProductDetailcontroller extends GetxController {
  static ProductDetailcontroller get instance => Get.find();

// variable to hold the selected Values

  RxMap selectedGrade = {}.obs;
  RxMap selectedweight = {}.obs;

// To Ensure the grade controller are cleared up after product detail screen closes

  List<Map> getAllgrades(ProductModel product,Map<String,dynamic>selectedgrade) {
    List<Map> grade = [];

    for (int i = 0; i < product.grades.length; i++) {
      grade.add(product.grades[i].toMap());
    }

    //if the grades are already set as moving from the cart screen dont change them
    //Selected only for the first time
    selectedGrade.value = selectedgrade;
    return grade;
  }

  addnewselectedgrade(GradeModel grades,) {}

  List<Map> getAllweightoptions(ProductModel product,Map<String,dynamic>selectedweights) {
    List<Map> weights = [];

    for (int i = 0; i < product.weightOptions.length; i++) {
      weights.add(product.weightOptions[i].toMap());
    }

    selectedweight.value = selectedweights;

    return weights;
  }
}
