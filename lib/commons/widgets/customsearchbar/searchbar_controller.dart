import 'package:get/get.dart';

class searchbarCOntroller extends GetxController{

 List rotationString=[
    "Cashew",
    "Nuts",
    "Almonds",
    "Seeds",
    "Flavoured"
 ]; 

  searchbarCOntroller get instance => Get.find();
 
 final  RxString searchbarhinttex='Cashew'.obs; 


 @override
  void onInit() {
    
     rotatesearchbartext(); 

    super.onInit();
  }
  
  void rotatesearchbartext(

  ) {
      int lentgh=rotationString.length;
      
      for(int i =0;i<lentgh;i++){
                
      }


  }


}