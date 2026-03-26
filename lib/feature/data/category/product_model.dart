class ProductModel {
  final String id;
  final String title;
  final String slug;
  final String icon;

  ProductModel(
      {required this.id, required this.title, required this.slug, required this.icon});

  factory ProductModel.formJson(Map<String, dynamic> jsonData){
    return ProductModel(
        id: jsonData["_id"],
        title: jsonData["title"] ?? "",
        slug: jsonData["slug"]?? "",
        icon: jsonData["icon"]??"");
  }

}