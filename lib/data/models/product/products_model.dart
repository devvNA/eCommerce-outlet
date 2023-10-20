import 'package:freezed_annotation/freezed_annotation.dart';
part 'products_model.freezed.dart';
part 'products_model.g.dart';

@freezed
class Products with _$Products {
  factory Products({
    @Default(0) int id,
    @Default('') String nama,
    @Default(0) int harga,
  }) = _Products;

  factory Products.fromJson(Map<String, Object?> json) =>
      _$ProductsFromJson(json);
}
