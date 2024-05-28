import 'dart:convert';

import 'package:get/get.dart';
import 'package:u1r/commons/widgets/loaders/Tcustomloader.dart';
import 'package:u1r/data/repos/product_repo.dart';
import 'package:u1r/features/shop/models/product_model.dart';
import 'package:u1r/local_storage/storage_utility.dart';

class FavouritesController extends GetxController{
  static FavouritesController get instance=>Get.find();
  
// variable to hold the data to be save in the 
final favourites=<String,bool>{}.obs;


void onInit(){


  super.onInit();
  initFavourites();
}
    //
  Future <void>initFavourites()async{ 
    final json=TLocalStorage.instance().readData('favourites');
      if(json!=null){

        final storedfavourites=jsonDecode(json) as Map<String,dynamic>;
        favourites.assignAll(storedfavourites.map((key, value) => MapEntry(key, value as bool)));
      
      }

  }


  bool istFavourites(String productID){
    return favourites[productID]??false;
  }

  void togglefavoritesproducts(String productID){

      if(!favourites.containsKey(productID)){
          favourites[productID]=true;
        savefavouritestostorage();
        Tcustomloaders.customToast(message: "Added to wishlist");
      
      }
      else{

        TLocalStorage.instance().readData(productID);
        favourites.remove(productID);
        savefavouritestostorage();
        favourites.refresh();    

        Tcustomloaders.customToast(message: "removed from wishlist");
       //loader here
       }
 
 
 
      
  }
 void savefavouritestostorage(){
    final encodeFavourites=json.encode(favourites);
    TLocalStorage.instance().saveData('favourites', encodeFavourites);
  }


  Future<List<ProductModel>>favouriteProduct()async{


    return await ProductRepository.instance.getfavouritesproducts(favourites.keys.toList());
  
  
    }


}