
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'api_services.dart';
import 'fakestore_model.dart';

class ProductProvider with ChangeNotifier{

  var titleController= TextEditingController();
  var priceController= TextEditingController();
  var descriptionController= TextEditingController();
  var categoryController= TextEditingController();
  var imageController= TextEditingController();
  List<FakestoreModel> productList=[];

  getProduct()async{
    var products =await ApiServices.getProductApi();
    if(products != null){
      productList.clear();
      productList.addAll(products);
      notifyListeners();
    }
  }

  addProduct(BuildContext context)async{
    var data = {
      "title": titleController.text,
      "price": priceController.text,
      "description":descriptionController.text,
      "category": categoryController.text,
      "image": imageController.text
    };
    var response = await ApiServices.postProductApiData(data);
    if(response != null){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Data added successfully")));
      getProduct();
    }
  }

  updateProduct(BuildContext context, int id)async{
    var data = {
      "id": id,
      "title": titleController.text,
      "price": priceController.text,
      "description":descriptionController.text,
      "category": categoryController.text,
      "image": imageController.text
    };
    var response = await ApiServices.updateProductApiData(data,);
    if(response != null){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Data updated successfully")));
      getProduct();
    }
  }

  deleteProduct(BuildContext context, int id) async{
    var response =await ApiServices.deleteProductApi(id);
    if(response != null){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Data deleted successfully")));
      getProduct();
    }
  }
}