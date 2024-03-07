// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'keranjang_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Keranjang _$KeranjangFromJson(Map<String, dynamic> json) {
  return _Keranjang.fromJson(json);
}

/// @nodoc
mixin _$Keranjang {
  @JsonKey(name: 'id')
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'id_user')
  int get idUser => throw _privateConstructorUsedError;
  @JsonKey(name: 'id_produk')
  int get idProduk => throw _privateConstructorUsedError;
  @JsonKey(name: 'quantity')
  int get quantity => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $KeranjangCopyWith<Keranjang> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $KeranjangCopyWith<$Res> {
  factory $KeranjangCopyWith(Keranjang value, $Res Function(Keranjang) then) =
      _$KeranjangCopyWithImpl<$Res, Keranjang>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int id,
      @JsonKey(name: 'id_user') int idUser,
      @JsonKey(name: 'id_produk') int idProduk,
      @JsonKey(name: 'quantity') int quantity});
}

/// @nodoc
class _$KeranjangCopyWithImpl<$Res, $Val extends Keranjang>
    implements $KeranjangCopyWith<$Res> {
  _$KeranjangCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? idUser = null,
    Object? idProduk = null,
    Object? quantity = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      idUser: null == idUser
          ? _value.idUser
          : idUser // ignore: cast_nullable_to_non_nullable
              as int,
      idProduk: null == idProduk
          ? _value.idProduk
          : idProduk // ignore: cast_nullable_to_non_nullable
              as int,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$KeranjangImplCopyWith<$Res>
    implements $KeranjangCopyWith<$Res> {
  factory _$$KeranjangImplCopyWith(
          _$KeranjangImpl value, $Res Function(_$KeranjangImpl) then) =
      __$$KeranjangImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int id,
      @JsonKey(name: 'id_user') int idUser,
      @JsonKey(name: 'id_produk') int idProduk,
      @JsonKey(name: 'quantity') int quantity});
}

/// @nodoc
class __$$KeranjangImplCopyWithImpl<$Res>
    extends _$KeranjangCopyWithImpl<$Res, _$KeranjangImpl>
    implements _$$KeranjangImplCopyWith<$Res> {
  __$$KeranjangImplCopyWithImpl(
      _$KeranjangImpl _value, $Res Function(_$KeranjangImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? idUser = null,
    Object? idProduk = null,
    Object? quantity = null,
  }) {
    return _then(_$KeranjangImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      idUser: null == idUser
          ? _value.idUser
          : idUser // ignore: cast_nullable_to_non_nullable
              as int,
      idProduk: null == idProduk
          ? _value.idProduk
          : idProduk // ignore: cast_nullable_to_non_nullable
              as int,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$KeranjangImpl implements _Keranjang {
  const _$KeranjangImpl(
      {@JsonKey(name: 'id') this.id = 0,
      @JsonKey(name: 'id_user') this.idUser = 0,
      @JsonKey(name: 'id_produk') this.idProduk = 0,
      @JsonKey(name: 'quantity') this.quantity = 0});

  factory _$KeranjangImpl.fromJson(Map<String, dynamic> json) =>
      _$$KeranjangImplFromJson(json);

  @override
  @JsonKey(name: 'id')
  final int id;
  @override
  @JsonKey(name: 'id_user')
  final int idUser;
  @override
  @JsonKey(name: 'id_produk')
  final int idProduk;
  @override
  @JsonKey(name: 'quantity')
  final int quantity;

  @override
  String toString() {
    return 'Keranjang(id: $id, idUser: $idUser, idProduk: $idProduk, quantity: $quantity)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$KeranjangImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.idUser, idUser) || other.idUser == idUser) &&
            (identical(other.idProduk, idProduk) ||
                other.idProduk == idProduk) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, idUser, idProduk, quantity);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$KeranjangImplCopyWith<_$KeranjangImpl> get copyWith =>
      __$$KeranjangImplCopyWithImpl<_$KeranjangImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$KeranjangImplToJson(
      this,
    );
  }
}

abstract class _Keranjang implements Keranjang {
  const factory _Keranjang(
      {@JsonKey(name: 'id') final int id,
      @JsonKey(name: 'id_user') final int idUser,
      @JsonKey(name: 'id_produk') final int idProduk,
      @JsonKey(name: 'quantity') final int quantity}) = _$KeranjangImpl;

  factory _Keranjang.fromJson(Map<String, dynamic> json) =
      _$KeranjangImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  int get id;
  @override
  @JsonKey(name: 'id_user')
  int get idUser;
  @override
  @JsonKey(name: 'id_produk')
  int get idProduk;
  @override
  @JsonKey(name: 'quantity')
  int get quantity;
  @override
  @JsonKey(ignore: true)
  _$$KeranjangImplCopyWith<_$KeranjangImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
