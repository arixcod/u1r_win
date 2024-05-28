import 'package:get/get.dart';
import 'package:u1r/data/repos/category_repo/category_repo.dart';
import 'package:u1r/data/repos/subcategoryrepo/subcategory_repo.dart';
import 'package:u1r/features/shop/models/category_model.dart';
import 'package:u1r/features/shop/models/subCategory_model.dart';
import 'package:u1r/utils/snackbars/customsnackbar.dart';

class CategoryController extends GetxController {

    static CategoryController get instance => Get.find();
    final isLoading = false.obs;
    final _categoriesRepo = Get.put(CategoryRepository());
    final _subcategoryRepo=Get.put(subCategoryRepository());

    RxList<CategoryModel> allcategories = <CategoryModel>[].obs;
    RxList<CategoryModel> featuredcategories = <CategoryModel>[].obs;

    // All the sub categories will be stored in here
    
    RxList<subCategoryModel> allsubcategories = <subCategoryModel>[].obs;
    
    //here subcategory controllers at work
 
      @override
     void onInit() {
        super.onInit();
        }


  // here we will try to redirect user from the categoryscreen to subcategory

  Future <void>fetchsubCategories(String parentID) async{
     try {      
        //show loader while loading
        isLoading.value = true;
        // Fetch Categories
        final subcategories = await _subcategoryRepo.getAllsubCategories();
        // update the category list      
       allsubcategories.assignAll(subcategories.where((sucategory) => sucategory.ParentId==parentID).toList());
      }
      catch (err){
        
          TcustomSnackbar.errorSnackbar(title: 'Oh snap!',message: err.toString());
        
        }
      finally{
        isLoading.value=false;
    }
  }
  

}
