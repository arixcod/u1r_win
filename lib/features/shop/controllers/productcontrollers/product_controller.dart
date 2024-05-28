import 'package:get/get.dart';
import 'package:u1r/data/repos/product_repo.dart';
import 'package:u1r/utils/snackbars/customsnackbar.dart';

import '../../models/product_model.dart';

class ProductController extends GetxController {
  static ProductController get instance => Get.find();

  final isLoading = false.obs;

  RxList<ProductModel> featuredproducts = <ProductModel>[].obs;

  final producrepository = Get.put(ProductRepository());

  @override
  void onInit() {
    fetchfeaturedproducts();
    super.onInit();
  }

  void fetchfeaturedproducts() async {
    try {
      // show the loader

      isLoading.value = true;

      // fetch products

      final products = await producrepository.getfeaturedproducts();

      //Assign the products to the featured products

      featuredproducts.assignAll(products);
    } catch (err) {
      TcustomSnackbar.errorSnackbar(title: 'Oh Snap !', message: err);
    } finally {
      isLoading.value = false;
    }
  }

  //This is the method to get all the products for the all product

  Future<List<ProductModel>> getAllproducts() async {
    try {
      //this is to get all the product ,Dont go by the name 'Category Wise'
      final products = await producrepository.getAllproductintheCategory();
      return products;
    } catch (err) {
      TcustomSnackbar.errorSnackbar(
          title: 'Oh Snap !', message: err.toString());
      return [];
    }
  }
}
