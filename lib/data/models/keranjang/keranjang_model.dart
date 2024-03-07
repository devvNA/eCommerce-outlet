// ignore_for_file: invalid_annotation_target
import 'package:freezed_annotation/freezed_annotation.dart';

part 'keranjang_model.freezed.dart';
part 'keranjang_model.g.dart';

@freezed
class Keranjang with _$Keranjang {
  const factory Keranjang({
    @JsonKey(name: 'id') @Default(0) int id,
    @JsonKey(name: 'id_user') @Default(0) int idUser,
    @JsonKey(name: 'id_produk') @Default(0) int idProduk,
    @JsonKey(name: 'quantity') @Default(0) int quantity,
  }) = _Keranjang;

  factory Keranjang.fromJson(Map<String, Object?> json) =>
      _$KeranjangFromJson(json);

  static List<Keranjang> jsonToList(List list) =>
      list.map((e) => Keranjang.fromJson(e as Map<String, dynamic>)).toList();
}

