import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:u1r/data/repos/category_repo/category_repo.dart';
import 'package:u1r/data/repos/subcategoryrepo/subcategory_repo.dart';
import 'package:u1r/features/shop/models/category_model.dart';
import 'package:u1r/features/shop/models/subCategory_model.dart';
import 'package:u1r/utils/snackbars/customsnackbar.dart';

class CategoryController extends GetxController {

    static CategoryController get instance => Get.find();
    final isLoading = false.obs;
    final isbodyloader=false.obs;
    final _categoriesRepo = Get.put(CategoryRepository());
    final _subcategoryRepo=Get.put(subCategoryRepository());

    RxList<CategoryModel> allcategories = <CategoryModel>[].obs;
    RxList<CategoryModel> featuredcategories = <CategoryModel>[].obs;

    // All the sub categories will be stored in here
    
    RxList<subCategoryModel> allsubcategories = <subCategoryModel>[].obs;
    
    //here subcategory controllers at work
 
  @override
     void onInit() {
    fetchCategories();
    super.onInit();
  }


  // here we will try to redirect user from the categoryscreen to subcategory

  Future <void>fetchsubCategories(String parentID) async{
     try {      
        
          // show loader while loading
            isLoading.value = true;
            isbodyloader.value=true;
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
        isbodyloader.value=true;
          
    }
  }
  

  Future<void> fetchCategories() async {
    try {
      
      //show loader while loading
      isLoading.value = true;

      // Fetch Categories

      final categories = await _categoriesRepo.getAllCategories();

      // update the category list
     
     
      allcategories.assignAll(categories);

      //filter featured categoris

      featuredcategories.assignAll(allcategories
          .where((category) => category.isFeatured && category.parentID.isEmpty)
          .take(8)
          .toList());
    } catch (err) {
      
    }   finally{

      isLoading.value=false;
      isbodyloader.value=true;
    }
  }
}
