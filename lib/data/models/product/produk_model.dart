class Produk {
  final int? id;
  final String? nama;
  final double? harga;
  final String? deskripsi;
  final String? kategori;
  final int? stok;
  final String? image;

  Produk({
    this.id,
    this.nama,
    this.harga,
    this.deskripsi,
    this.kategori,
    this.stok = 0,
    this.image,
  });

  factory Produk.fromJson(Map<String, dynamic> json) => Produk(
        id: json["id"],
        nama: json["nama"],
        harga: json["harga"]?.toDouble(),
        deskripsi: json["deskripsi"],
        kategori: json["kategori"],
        stok: json["stok"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nama": nama,
        "harga": harga,
        "deskripsi": deskripsi,
        "kategori": kategori,
        "stok": stok,
        "image": image,
      };
}
