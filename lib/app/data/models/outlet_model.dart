import 'dart:convert';

import 'package:flutter/widgets.dart';

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

  Outlet copyWith({
    ValueGetter<String?>? id,
    ValueGetter<String?>? idBts,
    ValueGetter<String?>? nama,
    ValueGetter<String?>? idJenis,
    ValueGetter<DateTime?>? createdAt,
    ValueGetter<DateTime?>? updatedAt,
  }) {
    return Outlet(
      id: id != null ? id() : this.id,
      idBts: idBts != null ? idBts() : this.idBts,
      nama: nama != null ? nama() : this.nama,
      idJenis: idJenis != null ? idJenis() : this.idJenis,
      createdAt: createdAt != null ? createdAt() : this.createdAt,
      updatedAt: updatedAt != null ? updatedAt() : this.updatedAt,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'idBts': idBts,
      'nama': nama,
      'idJenis': idJenis,
      'createdAt': createdAt?.millisecondsSinceEpoch,
      'updatedAt': updatedAt?.millisecondsSinceEpoch,
    };
  }

  factory Outlet.fromMap(Map<String, dynamic> map) {
    return Outlet(
      id: map['id'],
      idBts: map['idBts'],
      nama: map['nama'],
      idJenis: map['idJenis'],
      createdAt: map['createdAt'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['createdAt'])
          : null,
      updatedAt: map['updatedAt'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['updatedAt'])
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Outlet.fromJson(String source) => Outlet.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Outlet(id: $id, idBts: $idBts, nama: $nama, idJenis: $idJenis, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Outlet &&
        other.id == id &&
        other.idBts == idBts &&
        other.nama == nama &&
        other.idJenis == idJenis &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        idBts.hashCode ^
        nama.hashCode ^
        idJenis.hashCode ^
        createdAt.hashCode ^
        updatedAt.hashCode;
  }
}
