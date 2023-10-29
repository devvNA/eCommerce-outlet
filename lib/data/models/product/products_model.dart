class Products {
  int? id;
  final String? nama;
  final dynamic harga;
  final String? deskripsi;
  final int? stok;

  Products({
    this.id,
    this.nama,
    this.harga,
    this.deskripsi,
    this.stok,
  });

  factory Products.fromJson(Map<String, dynamic> json) => Products(
        id: json["id"],
        nama: json["nama"],
        harga: json["harga"],
        deskripsi: json["deskripsi"],
        stok: json["stok"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nama": nama,
        "harga": harga,
        "deskripsi": deskripsi,
        "stok": stok,
      };
}
