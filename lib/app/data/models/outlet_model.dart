import 'dart:convert';

class Outlet {
  int? id;
  String? email;
  String? namaOutlet;
  String? alamatOutlet;

  Outlet({
    this.id,
    this.email,
    this.namaOutlet,
    this.alamatOutlet,
  });

  Outlet copyWith({
    int? id,
    String? email,
    String? namaOutlet,
    String? alamatOutlet,
  }) =>
      Outlet(
        id: id ?? this.id,
        email: email ?? this.email,
        namaOutlet: namaOutlet ?? this.namaOutlet,
        alamatOutlet: alamatOutlet ?? this.alamatOutlet,
      );

  factory Outlet.fromRawJson(String str) => Outlet.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Outlet.fromJson(Map<String, dynamic> json) => Outlet(
        id: json["id"],
        email: json["email"],
        namaOutlet: json["nama_outlet"],
        alamatOutlet: json["alamat_outlet"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "nama_outlet": namaOutlet,
        "alamat_outlet": alamatOutlet,
      };
}
