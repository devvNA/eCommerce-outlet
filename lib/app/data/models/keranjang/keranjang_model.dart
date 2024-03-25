
class Keranjang {
  final int? id;
  final int? idUser;
  final int? idProduk;
  int? quantity;
  // final Produk produk;

  Keranjang({
    this.id,
    this.idUser,
    this.idProduk,
    this.quantity,
    // required this.produk,
  });

  factory Keranjang.fromJson(Map<String, dynamic> json) => Keranjang(
        id: json["id"],
        idUser: json["id_user"],
        idProduk: json["id_produk"],
        quantity: json["quantity"],
        // produk: Produk.fromJson(json["produk"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "id_user": idUser,
        "id_produk": idProduk,
        "quantity": quantity,
        // "produk": produk.toJson(),
      };
}