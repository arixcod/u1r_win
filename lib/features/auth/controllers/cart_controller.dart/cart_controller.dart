import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:u1r/commons/widgets/loaders/Tcustomloader.dart';
import 'package:u1r/data/repos/cart_repo/cart_repo.dart';
import 'package:u1r/data/repos/product_repo.dart';
import 'package:u1r/features/shop/controllers/productcontrollers/productgrade_controller.dart';
import 'package:u1r/features/shop/models/cart_model/cart_model.dart';
import 'package:u1r/features/shop/models/grades_model.dart';
import 'package:u1r/features/shop/models/product_model.dart';
import 'package:u1r/features/shop/models/weight_model.dart';
import 'package:u1r/features/shop/productdetails/productdetails.dart';
import 'package:u1r/features/shop/productdetails/productdetailsforcartitems.dart';
import 'package:u1r/local_storage/storage_utility.dart';

class cartController extends GetxController {
  static cartController get instance => Get.find();

  //variable to hold the cartItems

  RxList<CartModel> cartItems = <CartModel>[].obs;
  //RxString totalCheckoutPrice = ''.obs;
  // Repo to upload /download data from the

  //we are declaring an empty productmodel to pass while data loads for us..to navigate to the carts

  Rx<ProductModel> productmodelforcartNav = ProductModel.empty().obs;

  //variable

  RxInt noCartItems = 0.obs;
  RxDouble totalCartPrice = 0.0.obs;
  RxDouble productQuantityincart = 0.0.obs;
  final gradecontroller = GradeController.instance;
  final productRepo = Get.put(ProductRepository());

// constructor to load all the cart items

  cartController() {
    fetchcartItems();
  }

/* Here is the code to be used in Production */

  void additemtocart(ProductModel product) {
    // To track the  curently selcted grades
    final grade = gradecontroller.selectedGrade;
    final weight = gradecontroller.selectedweight;

    //Quantity Check4t5

    if (productQuantityincart.value < 1) {
      Tcustomloaders.customToast(message: "Select Quantity");
      return;
    }
    //check out of stock Status

    if (int.parse(product.stock) < 1) {
      Tcustomloaders.customToast(message: "Out of Stock");
      return;
    }
    final selectedcartItem =
        converttocartItem(product, productQuantityincart.value);

    int index = cartItems.indexWhere((cartitem) =>
        cartitem.productID == selectedcartItem.productID &&
        cartitem.selectedgrade!['grade'] == grade['grade'] &&
        cartitem.selecteweight!['weight'] == weight['weight']);

    // If the previously added
    if (index >= 0) {
      // Update the quantity if the productID and grade are the same
      cartItems[index].productQuantity = selectedcartItem.productQuantity;
    } else {
      // Product not in the cart, add a new entry
      cartItems.add(selectedcartItem);
    }

    // updating the cart here;
    updatecart();
    Tcustomloaders.customToast(message: "Added to Cart");
  }

  //update the cart function

  void updatecart() {
    updatecarttotal();
    savecartItems();
    cartItems.refresh();
  }

// To add Exaclty One Item to the Cart

  void addOneitemtocart(CartModel item) {
    int index = cartItems.indexWhere((carItem) =>
        carItem.productID == item.productID &&
        carItem.selectedgrade == item.selectedgrade &&
        carItem.selecteweight == item.selecteweight);
    if (index >= 0) {
      cartItems[index].productQuantity += 1;
    } else {
      cartItems.add(item);
    }
    updatecart();
  }

// To remove Exaclty One Item to the Cart

  void removeOneitemtocart(CartModel item) {
    int index = cartItems.indexWhere((carItem) =>
        carItem.productID == item.productID &&
        carItem.selectedgrade == item.selectedgrade &&
        carItem.selecteweight == item.selecteweight);

    if (index >= 0) {
      if (cartItems[index].productQuantity > 1) {
        cartItems[index].productQuantity -= 1;
      } else {
        cartItems[index].productQuantity == 1
            ? removefromcartDailoge(index)
            : cartItems.removeAt(index);
      }

      updatecart();
    }
  }

// Remove dialouge

  void removefromcartDailoge(int index) {
    Get.defaultDialog(
      title: 'Remove Product',
      middleText: 'This product will be removed from the cart',
      onConfirm: () {
        cartItems.removeAt(index);
        updatecart();
        Tcustomloaders.customToast(message: 'removed');
        Get.back();
      },
      onCancel: () => () => Get.back(),
    );
  }

// updating the total cart items

  void updatecarttotal() {
    double calculatedtotalprice = 0.0;
    int calculatedtotalitems = 0;

    for (var items in cartItems) {
      calculatedtotalprice +=
          double.parse(items.productprice) * items.productQuantity.toDouble();
      calculatedtotalitems += items.productQuantity.toInt();
    }

    totalCartPrice.value = calculatedtotalprice;
    noCartItems.value = calculatedtotalitems;
  }

// update already addedproduct count

  void updatealreadyaddedcount(ProductModel product) {
    if (product.isgraded == false) {
      productQuantityincart.value =
          getproductQuantityinCart(product.productId).toDouble();
    } else {
      productQuantityincart.value =
          getGradedproductquantityinthecart(product.productId).toDouble();
    }
  }

  void savecartItems() {
    final cartitemsString = cartItems.map((item) => item.toMap()).toList();
    TLocalStorage.instance().saveData('cartItems', cartitemsString);
  }

  void fetchcartItems() {
    final cartItemString =
        TLocalStorage.instance().readData<List<dynamic>>('cartItems');

    if (cartItemString != null) {
      cartItems.assignAll(cartItemString
          .map((item) => CartModel.fromMap(item as Map<String, dynamic>)));
      updatecarttotal();
    }
  }

  int getproductQuantityinCart(String ProductID) {
    final founItems = cartItems
        .where((item) => item.productID == ProductID)
        .fold(
            0,
            (previousValue, element) =>
                previousValue + (element.productQuantity).toInt());

    return founItems;
  }

  int getGradedproductquantityinthecart(String productId) {
    final founditem = cartItems.firstWhere(
      (item) => item.productID == productId,
      orElse: () => CartModel.empty(),
    );

    return founditem.productQuantity.toInt();
  }

  //clearing the cart

  void clearCart() {
    productQuantityincart.value = 0;
    cartItems.clear();
    updatecart();
  }

// function to convert the product model to cartitem model

  CartModel converttocartItem(ProductModel product, double quantity) {
    final grade = gradecontroller.selectedGrade;
    final weight = gradecontroller.selectedweight;

    //to make the product
    final isaGradedproduct = product.isgraded;
      print(product.isgraded);
    // how to take price of the product if its not graded

    final price = isaGradedproduct
        ? double.parse(grade['salesPrice'])
        : double.parse(product.productPrice);
    // Extract the grade information

    final selectedGradeInfo = Map.from(grade);
    final selectedweightInfo = Map.from(weight);

    return CartModel(
        thumbImage: product.photoUrl,
        productQuantity: quantity,
        productID: product.productId,
        productName: product.productname,
        productprice: price.toString(),
        selectedgrade: (selectedGradeInfo).cast<String, dynamic>(),
        selecteweight: selectedweightInfo.cast<String, dynamic>(),
        brand: product.brandName,
        variations: product.variations,
        productweight: product.productWeight);
  }

// Naviagate to the product details screen from cart tile

  void naviagatetoproduct(CartModel carItem) async {
    // to change the slected grade and selected weight option we have to tweak their controllers
    final grademodelselection = gradecontroller;
    grademodelselection.selectedGrade.value = carItem.selectedgrade!;
    grademodelselection.selectedweight.value = carItem.selecteweight!;

    // here not awaiting for the data just moving and wait for this function to update the data

    final res = convertcartItemtoProductmodel(carItem).then((result) => productmodelforcartNav.value = result);

    //  productmodelforcartNav.value=res;

    Get.to(
        () => ProductdetailcreenforCartitems(
              product: productmodelforcartNav,
              selectedgrades: carItem.selectedgrade,
              selectedweights: carItem.selecteweight,
            ),
        opaque: true,
        transition: Transition.rightToLeftWithFade,
        duration: Duration(microseconds: 1000));
  }

 // function to convert the cartmmodel to productmodel

  Future<ProductModel> convertcartItemtoProductmodel(CartModel cartitem) async {
 
 
    bool productisgraded;
    if (cartitem.selectedgrade!['grade']!='') {
      productisgraded = true;
    } else {
      productisgraded = false;
    }

    // first we get the remianing details of the product

    final product = await productRepo.getremianderproduct(
      cartitem.productID,
    );

    return ProductModel(
        isgraded: productisgraded,
        //used for REFRENCE price
        Productactualprice: product.Productactualprice,
        variations: cartitem.variations,
        productname: cartitem.productName,
        photoUrl: cartitem.thumbImage,
        productId: cartitem.productID,
        productCategory: product.productCategory,
        productSubcategory: product.productSubcategory,
        productDetails: product.productDetails,
        grades: product.grades,
        weightOptions: product.weightOptions,
        productPrice: cartitem.productprice,
        productWeight: cartitem.selecteweight!['weight']==''?product.productWeight:cartitem.selecteweight!['weight'],
        images: product.images,
        sku: product.sku,
        stock: product.stock,
        brandName: cartitem.brand);
  }
}
