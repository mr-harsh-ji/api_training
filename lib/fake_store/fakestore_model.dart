class FakestoreModel {
  int? id;
  String? title;
  String? price;
  String? description;
  String? category;
  String? image;

  FakestoreModel(
    this.id,
    this.title,
    this.price,
    this.description,
    this.category,
    this.image,
  );

  static FakestoreModel jsonToModel(Map<String, dynamic> data) {
    return FakestoreModel(
      data["id"],
      data["title"],
      data["price"].toString(),
      data["description"],
      data["category"],
      data["image"],
    );
  }
}
