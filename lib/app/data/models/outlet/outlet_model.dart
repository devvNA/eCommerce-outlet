class Outlet {
  final String? id;
  final String? idBts;
  final String? nama;
  final String? idJenis;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  Outlet({
    this.id,
    this.idBts,
    this.nama,
    this.idJenis,
    this.createdAt,
    this.updatedAt,
  });

  factory Outlet.fromJson(Map<String, dynamic> json) => Outlet(
        id: json["id"],
        idBts: json["id_bts"],
        nama: json["nama"],
        idJenis: json["id_jenis"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "id_bts": idBts,
        "nama": nama,
        "id_jenis": idJenis,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}
