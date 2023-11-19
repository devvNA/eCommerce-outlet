// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'produk_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProdukImpl _$$ProdukImplFromJson(Map<String, dynamic> json) => _$ProdukImpl(
      id: json['id'] as int? ?? 0,
      nama: json['nama'] as String? ?? "",
      harga: json['harga'] as int? ?? 0,
      deskripsi: json['deskripsi'] as String? ?? "",
      stok: json['stok'] as int? ?? 0,
    );

Map<String, dynamic> _$$ProdukImplToJson(_$ProdukImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nama': instance.nama,
      'harga': instance.harga,
      'deskripsi': instance.deskripsi,
      'stok': instance.stok,
    };
