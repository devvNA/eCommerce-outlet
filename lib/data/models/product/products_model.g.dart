// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'products_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProductsImpl _$$ProductsImplFromJson(Map<String, dynamic> json) =>
    _$ProductsImpl(
      id: json['id'] as int? ?? 0,
      nama: json['nama'] as String? ?? '',
      harga: json['harga'] as int? ?? 0,
    );

Map<String, dynamic> _$$ProductsImplToJson(_$ProductsImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nama': instance.nama,
      'harga': instance.harga,
    };
