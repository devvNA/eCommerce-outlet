// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'produk_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Produk _$ProdukFromJson(Map<String, dynamic> json) {
  return _Produk.fromJson(json);
}

/// @nodoc
mixin _$Produk {
  @JsonKey(name: 'id')
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'nama')
  String get nama => throw _privateConstructorUsedError;
  @JsonKey(name: 'harga')
  int get harga => throw _privateConstructorUsedError;
  @JsonKey(name: 'deskripsi')
  String get deskripsi => throw _privateConstructorUsedError;
  @JsonKey(name: 'stok')
  int get stok => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProdukCopyWith<Produk> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProdukCopyWith<$Res> {
  factory $ProdukCopyWith(Produk value, $Res Function(Produk) then) =
      _$ProdukCopyWithImpl<$Res, Produk>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int id,
      @JsonKey(name: 'nama') String nama,
      @JsonKey(name: 'harga') int harga,
      @JsonKey(name: 'deskripsi') String deskripsi,
      @JsonKey(name: 'stok') int stok});
}

/// @nodoc
class _$ProdukCopyWithImpl<$Res, $Val extends Produk>
    implements $ProdukCopyWith<$Res> {
  _$ProdukCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? nama = null,
    Object? harga = null,
    Object? deskripsi = null,
    Object? stok = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      nama: null == nama
          ? _value.nama
          : nama // ignore: cast_nullable_to_non_nullable
              as String,
      harga: null == harga
          ? _value.harga
          : harga // ignore: cast_nullable_to_non_nullable
              as int,
      deskripsi: null == deskripsi
          ? _value.deskripsi
          : deskripsi // ignore: cast_nullable_to_non_nullable
              as String,
      stok: null == stok
          ? _value.stok
          : stok // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProdukImplCopyWith<$Res> implements $ProdukCopyWith<$Res> {
  factory _$$ProdukImplCopyWith(
          _$ProdukImpl value, $Res Function(_$ProdukImpl) then) =
      __$$ProdukImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int id,
      @JsonKey(name: 'nama') String nama,
      @JsonKey(name: 'harga') int harga,
      @JsonKey(name: 'deskripsi') String deskripsi,
      @JsonKey(name: 'stok') int stok});
}

/// @nodoc
class __$$ProdukImplCopyWithImpl<$Res>
    extends _$ProdukCopyWithImpl<$Res, _$ProdukImpl>
    implements _$$ProdukImplCopyWith<$Res> {
  __$$ProdukImplCopyWithImpl(
      _$ProdukImpl _value, $Res Function(_$ProdukImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? nama = null,
    Object? harga = null,
    Object? deskripsi = null,
    Object? stok = null,
  }) {
    return _then(_$ProdukImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      nama: null == nama
          ? _value.nama
          : nama // ignore: cast_nullable_to_non_nullable
              as String,
      harga: null == harga
          ? _value.harga
          : harga // ignore: cast_nullable_to_non_nullable
              as int,
      deskripsi: null == deskripsi
          ? _value.deskripsi
          : deskripsi // ignore: cast_nullable_to_non_nullable
              as String,
      stok: null == stok
          ? _value.stok
          : stok // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProdukImpl implements _Produk {
  const _$ProdukImpl(
      {@JsonKey(name: 'id') this.id = 0,
      @JsonKey(name: 'nama') this.nama = "",
      @JsonKey(name: 'harga') this.harga = 0,
      @JsonKey(name: 'deskripsi') this.deskripsi = "",
      @JsonKey(name: 'stok') this.stok = 0});

  factory _$ProdukImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProdukImplFromJson(json);

  @override
  @JsonKey(name: 'id')
  final int id;
  @override
  @JsonKey(name: 'nama')
  final String nama;
  @override
  @JsonKey(name: 'harga')
  final int harga;
  @override
  @JsonKey(name: 'deskripsi')
  final String deskripsi;
  @override
  @JsonKey(name: 'stok')
  final int stok;

  @override
  String toString() {
    return 'Produk(id: $id, nama: $nama, harga: $harga, deskripsi: $deskripsi, stok: $stok)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProdukImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.nama, nama) || other.nama == nama) &&
            (identical(other.harga, harga) || other.harga == harga) &&
            (identical(other.deskripsi, deskripsi) ||
                other.deskripsi == deskripsi) &&
            (identical(other.stok, stok) || other.stok == stok));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, nama, harga, deskripsi, stok);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProdukImplCopyWith<_$ProdukImpl> get copyWith =>
      __$$ProdukImplCopyWithImpl<_$ProdukImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProdukImplToJson(
      this,
    );
  }
}

abstract class _Produk implements Produk {
  const factory _Produk(
      {@JsonKey(name: 'id') final int id,
      @JsonKey(name: 'nama') final String nama,
      @JsonKey(name: 'harga') final int harga,
      @JsonKey(name: 'deskripsi') final String deskripsi,
      @JsonKey(name: 'stok') final int stok}) = _$ProdukImpl;

  factory _Produk.fromJson(Map<String, dynamic> json) = _$ProdukImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  int get id;
  @override
  @JsonKey(name: 'nama')
  String get nama;
  @override
  @JsonKey(name: 'harga')
  int get harga;
  @override
  @JsonKey(name: 'deskripsi')
  String get deskripsi;
  @override
  @JsonKey(name: 'stok')
  int get stok;
  @override
  @JsonKey(ignore: true)
  _$$ProdukImplCopyWith<_$ProdukImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
