class Keranjang {
  final int? idKeranjang;
  final int? idProduk;
  final String? namaBarang;
  final String? jenisBarang;
  final int? hargaBarang;
  int? quantity;

  Keranjang({
    this.idKeranjang,
    this.idProduk,
    this.namaBarang,
    this.jenisBarang,
    this.hargaBarang,
    this.quantity,
  });

  factory Keranjang.fromJson(Map<String, dynamic> json) => Keranjang(
        idKeranjang: json["id_keranjang"],
        idProduk: json["id_produk"],
        namaBarang: json["nama_barang"],
        jenisBarang: json["jenis_barang"],
        hargaBarang: json["harga_barang"],
        quantity: json["quantity"],
      );

  Map<String, dynamic> toJson() => {
        "id_keranjang": idKeranjang,
        "id_produk": idProduk,
        "nama_barang": namaBarang,
        "jenis_barang": jenisBarang,
        "harga_barang": hargaBarang,
        "quantity": quantity,
      };
}
