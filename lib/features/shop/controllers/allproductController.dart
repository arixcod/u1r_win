import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:u1r/commons/widgets/loaders/Tcustomloader.dart';
import 'package:u1r/data/repos/product_repo.dart';
import 'package:u1r/features/shop/models/product_model.dart';
import 'package:u1r/utils/snackbars/customsnackbar.dart';

class AllProductController extends GetxController {
  static AllProductController get instance => Get.find();
  final repository = ProductRepository.instance;

  final RxString selectedSortableOption = 'Name'.obs;

  final RxList<ProductModel> products = <ProductModel>[].obs;

  Future<List<ProductModel>> fetchProductByquery(Query? query) async {
    try {
      //

      if (query == null) return [];
      final products = repository.getallproductbyquerry(query);
      return products;
    } catch (err) {
      TcustomSnackbar.errorSnackbar(
          title: 'oh Snap !', message: err.toString());
      return [];
    }
  }

  void SortProducts(String SortOptions) {
    selectedSortableOption.value = SortOptions;

    switch (SortOptions) {
      case 'Name':
        products.sort(
          (a, b) => a.productname.compareTo(b.productname),
        );
        break;

      case 'Higher Price':
        products.sort(
          (a, b) => b.productPrice.compareTo(a.productPrice),
        );
        break;

      case 'Lower Price':
        products.sort(
          (a, b) => a.productPrice.compareTo(b.productPrice),
        );
        break;

      // Date is not added to the Backend  So will add soon
      // case 'Newest':
      //   products.sort((a, b) => a.compareTo(b.Productactualprice),);
      //   break;
      case 'Sale':
        products.sort((a, b) {
          if (int.parse(b.Productactualprice) > 0) {
            return b.Productactualprice.compareTo(a.Productactualprice);
          } else if (int.parse(a.Productactualprice) > 0) {
            return -1;
          } else {
            return 1;
          }
        });
        break;
      default:
        //default products are sorted by Name

        products.sort(
          (a, b) => a.productname.compareTo(b.productname),
        );
    }
  }

  void assignProducts(List<ProductModel> products) {
    this.products.assignAll(products);
    SortProducts('Name');
  }
}
