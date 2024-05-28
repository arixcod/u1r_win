import 'package:get/get.dart';
import 'package:u1r/data/repos/bannerrepo/banner_repository.dart';
import 'package:u1r/data/repos/category_repo/category_repo.dart';
import 'package:u1r/features/shop/models/banner_model.dart';
import 'package:u1r/features/shop/models/category_model.dart';

class BannerController extends GetxController {

  static BannerController get instance => Get.find();
  final isLoading = false.obs;
  final carouselControlleindexr = 0.obs;
  final RxList<BannerModel> bannerss= <BannerModel>[].obs;


  //update page navigation dots

   void updatePageIndicator(index) {
    carouselControlleindexr.value = index;
  }
 
  @override
  void onInit() {
    fetchbanners();
    super.onInit();
  }

      Future<void> fetchbanners() async {
       try {
      
        //show loader while loading
          isLoading.value = true;
        // Fetch banners


        final bannerRepo=Get.put(BannerRepository());
        final banners = await bannerRepo.getAllactivebanners();

         //Assign the banners
      
        bannerss.assignAll(banners);




      // featuredcategories.assignAll(allcategories
      //     .where((category) => category.isFeatured && category.parentID.isEmpty)
      //     .take(8)
      //     .toList());
   
     
     
     
      } catch (err) {
      
      }finally{

      isLoading.value=false;
    }
  }
}
