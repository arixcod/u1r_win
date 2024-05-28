import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:u1r/data/repos/product_repo.dart';
import 'package:u1r/features/search_feature/response_model.dart';
import 'package:u1r/features/shop/models/product_model.dart';
import 'package:u1r/features/shop/productdetails/productdetails.dart';

class Searchbarcontroller extends GetxController {
  static Searchbarcontroller get instance => Get.find();


  RxList<ProductModel> productss = <ProductModel>[].obs;

  RxList<searchResponseModel> searched_products = <searchResponseModel>[].obs;

  RxString jsonstr = ''.obs;

  RxBool isdatafoundempty=false.obs;

  Rx<String> searchText=''.obs;
  Rx<TextEditingController> searchtextEditingController=TextEditingController().obs;

    RxList<Map<String,dynamic>>autosearch=[<String,dynamic>{}].obs;
  
    //
  void setSearchText(String text) {
    searchText.value = text;
  }
  // to show the progress indicator
  
  RxBool isloading = false.obs;





  Future<Map<String, dynamic>> performSearch(String query) async {

    try{
      
    if(query!=''){
    
      isloading.value=true;  
      final response = await http.get(
      Uri.parse('https://lifesciencemedia.in/fastapi/search?query=$query'),
    );

    if (response.statusCode == 200) {
      // Parse the JSON response

      final json_res = json.decode(response.body);
      final results = (json_res['results'] as List<dynamic>)
          .map((e) => ProductModel.fromJSon(e))
          .toList();

      productss.assignAll(results);
//      print(productss);

      // Check if results are empty
      if (results.isEmpty) {
      // Set a flag indicating no results found
        
        isdatafoundempty.value = true;
      } else {
        // Clear the flag if results are found
        isdatafoundempty.value = false;
      }
      //  print(productss.first.brandName);

      jsonstr.value = jsonEncode(json_res['results']);
      isloading.value=false;
      return json.decode(response.body);
      
    } else {
      // Handle error cases
      throw Exception('Failed to load search results');
    }
  }
  else{
    return {};
  }


  }catch(err){
      isloading.value=false;
       throw Exception('Something went wrong!');
  }
  
  
  }

  onInit(){

    autosearch.clear();
    super.onInit();
  }






// To Get the Suggesttions Only 
Future<List<dynamic>> getautosugestions(String query) async {

    try{
      
        if(query!=''){     
      final response = await http.get(
      Uri.parse('https://lifesciencemedia.in/fastapi/search-suggestions?query=$query'),
    );

    if (response.statusCode == 200) {
      // Parse the JSON response

      final json_res = json.decode(response.body);
      autosearch.clear();
      for(final item in json_res){
        autosearch.add(Map<String,dynamic>.from(item));
      }

      // Check if results are empty
      return json.decode(response.body);
      
    } else {
      // Handle error cases
      throw Exception('Failed to load search results');
    }
  }
  else{
    return [{}];
  }


  }catch(err){
      throw Exception('Something went wrong!');
  }
  
  
  }


  Future<void> getoneProductdata(String productId)async{

     final product= await ProductRepository.instance.getproductviaProductId(productId);
      //when we have the product 
     Get.to(()=>Productdetailcreen(product: product));
   
  }




}
