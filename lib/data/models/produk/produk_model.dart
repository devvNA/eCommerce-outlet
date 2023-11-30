// ignore_for_file: invalid_annotation_target
import 'package:freezed_annotation/freezed_annotation.dart';

part 'produk_model.freezed.dart';
part 'produk_model.g.dart';

@freezed
class Produk with _$Produk {
  const factory Produk({
    @JsonKey(name: 'id') @Default(0) int id,
    @JsonKey(name: 'nama') @Default("") String nama,
    @JsonKey(name: 'harga') @Default(0) int harga,
    @JsonKey(name: 'deskripsi') @Default("") String deskripsi,
    @JsonKey(name: 'stok') @Default(0) int stok,
  }) = _Produk;

  factory Produk.fromJson(Map<String, Object?> json) => _$ProdukFromJson(json);

  static List<Produk> jsonToList(List list) =>
      list.map((e) => Produk.fromJson(e as Map<String, dynamic>)).toList();
}
