import 'package:get/get.dart';
import 'package:u1r/features/shop/models/product_model.dart';

import '../../models/grades_model.dart';

class GradeController extends GetxController {
  static GradeController get instance => Get.find();

  //variable to hold the selected Values

  RxMap selectedGrade = {}.obs;
  RxMap selectedweight = {}.obs;

  // Rx<GradeModel>selectedgrade=GradeModel.empty().obs;
  // get All the grades if Available
  //To reset the Values Once Adde to The cart

  List<Map> getAllgrades(ProductModel product) {
    List<Map> grade = [];
   
    for (int i = 0; i < product.grades.length; i++) {
      grade.add(product.grades[i].toMap());
    
    
    
    }

    //if the grades are already set as moving from the cart screen dont change them
    //Selected only for the first time
      selectedGrade.value = grade.first;
    return grade;
  
  
  
  
  
  }

  addnewselectedgrade(GradeModel grades) {}

  List<Map> getAllweightoptions(ProductModel product) {
    List<Map> weights = [];

    for (int i = 0; i < product.weightOptions.length; i++) {
      weights.add(product.weightOptions[i].toMap());
    }

      selectedweight.value = weights.first;
    
    return weights;
  }





}
