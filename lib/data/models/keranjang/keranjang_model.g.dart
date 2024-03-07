// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'keranjang_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$KeranjangImpl _$$KeranjangImplFromJson(Map<String, dynamic> json) =>
    _$KeranjangImpl(
      id: json['id'] as int? ?? 0,
      idUser: json['id_user'] as int? ?? 0,
      idProduk: json['id_produk'] as int? ?? 0,
      quantity: json['quantity'] as int? ?? 0,
    );

Map<String, dynamic> _$$KeranjangImplToJson(_$KeranjangImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'id_user': instance.idUser,
      'id_produk': instance.idProduk,
      'quantity': instance.quantity,
    };
