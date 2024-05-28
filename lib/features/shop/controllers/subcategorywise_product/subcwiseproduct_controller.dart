import 'package:get/get.dart';
import 'package:u1r/data/repos/subcategoryrepo/subcategorywiseproductRepo.dart';
import 'package:u1r/features/shop/models/product_model.dart';

class subcategorywiseController extends GetxController{

  static subcategorywiseController get instance=>Get.find();

  //repo call here
  
  final subcpRepo=Get.put(subCategorywiseproductRepository());
  RxList<ProductModel> allproducts = <ProductModel>[].obs;
  
  //creating the constructor for getting the value from ui


  final String subcategryId;
  subcategorywiseController({required this.subcategryId});

  final RxBool isLoading=false.obs;

  @override
  void onInit() {
    
   fetchallsubCategorywiseproducts(subcategryId);
    super.onInit(); 
  }
  
 Future<void> fetchallsubCategorywiseproducts(String subcategryId) async{
      try{
          
          //start the loader
        isLoading.value=true;
        final products= await subcpRepo.getAllsubCategorieswiseproduct(subcategryId);
        allproducts.assignAll(products);
      }
      
      catch(err){
       rethrow;
      }

      finally{
          isLoading.value=false;

      }


  } 


}