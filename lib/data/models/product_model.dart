class ProductModel {
  int? id;
  String? image;
  String? name;
  String? description;
  int? stock;
  int? quantity;
  int? price;
  String? size;
  bool? isFavorite;
  ProductModel(
      {this.id,
      this.image,
      this.name,
      this.stock,
      this.quantity,
      this.price,
      this.description,
      this.size,
      this.isFavorite});
}
