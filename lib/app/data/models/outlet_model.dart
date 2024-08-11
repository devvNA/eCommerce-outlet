import 'package:equatable/equatable.dart';

class Outlet extends Equatable {
  const Outlet({
    required this.id,
    required this.email,
    required this.password,
    required this.namaOutlet,
    required this.alamat,
    required this.idJenis,
    required this.jenisOutlet,
    required this.status,
    required this.code,
    required this.createdAt,
    required this.updatedAt,
  });

  final int id;
  final String email;
  final String password;
  final String namaOutlet;
  final String alamat;
  final String idJenis;
  final JenisOutlet? jenisOutlet;
  final String status;
  final dynamic code;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  Outlet copyWith({
    int? id,
    String? email,
    String? password,
    String? namaOutlet,
    String? alamat,
    String? idJenis,
    JenisOutlet? jenisOutlet,
    String? status,
    dynamic code,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return Outlet(
      id: id ?? this.id,
      email: email ?? this.email,
      password: password ?? this.password,
      namaOutlet: namaOutlet ?? this.namaOutlet,
      alamat: alamat ?? this.alamat,
      idJenis: idJenis ?? this.idJenis,
      jenisOutlet: jenisOutlet ?? this.jenisOutlet,
      status: status ?? this.status,
      code: code ?? this.code,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  factory Outlet.fromJson(Map<String, dynamic> json) {
    return Outlet(
      id: json["id"] ?? 0,
      email: json["email"] ?? "",
      password: json["password"] ?? "",
      namaOutlet: json["nama_outlet"] ?? "",
      alamat: json["alamat"] ?? "",
      idJenis: json["id_jenis"] ?? "",
      jenisOutlet: json["jenis_outlet"] == null
          ? null
          : JenisOutlet.fromJson(json["jenis_outlet"]),
      status: json["status"] ?? "",
      code: json["code"],
      createdAt: DateTime.tryParse(json["created_at"] ?? ""),
      updatedAt: DateTime.tryParse(json["updated_at"] ?? ""),
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "password": password,
        "nama_outlet": namaOutlet,
        "alamat": alamat,
        "id_jenis": idJenis,
        "jenis_outlet": jenisOutlet?.toJson(),
        "status": status,
        "code": code,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };

  @override
  List<Object?> get props => [
        id,
        email,
        password,
        namaOutlet,
        alamat,
        idJenis,
        jenisOutlet,
        status,
        code,
        createdAt,
        updatedAt,
      ];
}

class JenisOutlet extends Equatable {
  const JenisOutlet({
    required this.id,
    required this.nama,
  });

  final int id;
  final String nama;

  JenisOutlet copyWith({
    int? id,
    String? nama,
  }) {
    return JenisOutlet(
      id: id ?? this.id,
      nama: nama ?? this.nama,
    );
  }

  factory JenisOutlet.fromJson(Map<String, dynamic> json) {
    return JenisOutlet(
      id: json["id"] ?? 0,
      nama: json["nama"] ?? "",
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "nama": nama,
      };

  @override
  List<Object?> get props => [
        id,
        nama,
      ];
}
