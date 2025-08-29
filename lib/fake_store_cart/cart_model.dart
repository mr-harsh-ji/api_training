class CartModel {
  int? id;
  String? title;
  List<Products>? products;

  CartModel(this.id, this.title, this.products);

  static CartModel jsonToModel(Map<String, dynamic> data) {
    List<dynamic> product = data["products"];
    var cartModelList = product
        .map((e) => Products.jsonToModel(e),)
        .toList();
    return CartModel(data["id"], data["title"], cartModelList);
  }
}

class Products {
  int? productId;
  int? quantity;

  Products(this.productId, this.quantity);

  static Products jsonToModel(Map<String, dynamic> data) {
    return Products(data["productId"], data["quantity"]);
  }
}
