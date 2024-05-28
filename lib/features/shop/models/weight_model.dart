import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:u1r/features/shop/models/grades_model.dart';

class WeighteModel {
  
      WeighteModel({required this.weight, });
          
          final String weight;
         
  // empty product model to return if no data is found
     static WeighteModel empty() => WeighteModel(weight: '');
      Map<String, dynamic> toMap() {
          return {
              "weight":weight,
         };
  }


  factory WeighteModel.fromJson(Map<String,dynamic>data1) {
    final data = data1; 
       
    return WeighteModel
          (
            weight: data['weight']??'',
          );
  }
}

