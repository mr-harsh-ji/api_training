import 'dart:convert';

import 'package:http/http.dart' as http;

import 'cart_model.dart';

class CartServices {
  static Future<List<dynamic>?> getCartApi() async {
    var response = await http.get(
      Uri.parse("https://fakestoreapi.com/carts"),
    );
    if (response.statusCode == 200) {
      var data = response.body;
      List<dynamic> jsonData = jsonDecode(data);
      var convertToModel = jsonData
          .map((e) => CartModel.jsonToModel(e))
          .toList();
      return convertToModel;
    }
    return null;
  }


//   static Future<FakestoreModel?> postProductApiData(Map<String, dynamic> data)async{
//     var response =await http.post(Uri.parse("https://fakestoreapi.com/products"),body: data);
//     print(response.body);
//     if(response.statusCode == 201){
//       var resBody = response.body;
//       dynamic jsonBody = jsonDecode(resBody); // convert String data to json for taking value in key and vale
//       var convertToModel = FakestoreModel.jsonToModel(jsonBody); // converting map
//       return convertToModel;
//     }
//     return null;
//   }
//
//   static Future<FakestoreModel?> putProductApiData(
//     Map<String, dynamic> data,
//   ) async {
//     var putResponse = await http.put(
//       Uri.parse("https://fakestoreapi.com/products"),
//       headers: {},
//       body: {},
//     );
//     if (putResponse.statusCode == 201) {
//       var resBody = putResponse.body;
//       dynamic jsonBody = jsonDecode(
//         resBody,
//       ); // convert String data to json for taking value in key and vale
//       var convertToModel = FakestoreModel.jsonToModel(
//         jsonBody,
//       ); // converting map
//       return convertToModel;
//     }
//     return null;
//   }
//
//   static Future<FakestoreModel?> updateProductApiData(Map<String, dynamic> data)async{
//     var response =await http.put(Uri.parse("https://fakestoreapi.com/products/${data['id']}"),body: data);
//     print(response.body);
//     if(response.statusCode == 200){
//       var resBody = response.body;
//       dynamic jsonBody = jsonDecode(resBody); // convert String data to json for taking value in key and vale
//       var convertToModel = FakestoreModel.jsonToModel(jsonBody); // converting map
//       return convertToModel;
//     }
//     return null;
//   }
//   static Future<String?> deleteProductApi(int id)async{
//     var response =await http.delete(Uri.parse("https://fakestoreapi.com/products/$id"));
//     if(response.statusCode==200){
//       return "success";
//     }
//     return null;
//   }
}
