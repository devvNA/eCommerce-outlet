// To parse this JSON data, do
//
//     final keranjang = keranjangFromJson(jsonString);

import 'dart:convert';

Keranjang keranjangFromJson(String str) => Keranjang.fromJson(json.decode(str));

String keranjangToJson(Keranjang data) => json.encode(data.toJson());

class Keranjang {
  int? id;
  int? idUser;
  int? idProduk;
  int? quantity;

  get getId => id;

  set setId(id) => this.id = id;

  get getIdUser => idUser;

  set setIdUser(idUser) => this.idUser = idUser;

  get getIdProduk => idProduk;

  set setIdProduk(idProduk) => this.idProduk = idProduk;

  get getQuantity => quantity;

  set setQuantity(quantity) => this.quantity = quantity;

  Keranjang({
    this.id,
    this.idUser,
    this.idProduk,
    this.quantity,
  });

  factory Keranjang.fromJson(Map<String, dynamic> json) => Keranjang(
        id: json["id"],
        idUser: json["id_user"],
        idProduk: json["id_produk"],
        quantity: json["quantity"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "id_user": idUser,
        "id_produk": idProduk,
        "quantity": quantity,
      };
}
