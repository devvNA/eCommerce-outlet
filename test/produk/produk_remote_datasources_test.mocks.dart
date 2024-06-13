// Mocks generated by Mockito 5.4.4 from annotations
// in marvelindo_outlet/test/produk/produk_remote_datasources_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:dartz/dartz.dart' as _i2;
import 'package:marvelindo_outlet/app/core/networking/failure_helper.dart'
    as _i5;
import 'package:marvelindo_outlet/app/data/datasources/produk_remote_datasources.dart'
    as _i3;
import 'package:marvelindo_outlet/app/data/models/produk_model.dart' as _i6;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeEither_0<L, R> extends _i1.SmartFake implements _i2.Either<L, R> {
  _FakeEither_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [ProdukRemoteDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockProdukRemoteDataSource extends _i1.Mock
    implements _i3.ProdukRemoteDataSource {
  @override
  _i4.Future<_i2.Either<_i5.Failure, List<_i6.Produk>>> getAllProduk() =>
      (super.noSuchMethod(
        Invocation.method(
          #getAllProduk,
          [],
        ),
        returnValue:
            _i4.Future<_i2.Either<_i5.Failure, List<_i6.Produk>>>.value(
                _FakeEither_0<_i5.Failure, List<_i6.Produk>>(
          this,
          Invocation.method(
            #getAllProduk,
            [],
          ),
        )),
        returnValueForMissingStub:
            _i4.Future<_i2.Either<_i5.Failure, List<_i6.Produk>>>.value(
                _FakeEither_0<_i5.Failure, List<_i6.Produk>>(
          this,
          Invocation.method(
            #getAllProduk,
            [],
          ),
        )),
      ) as _i4.Future<_i2.Either<_i5.Failure, List<_i6.Produk>>>);

  @override
  _i4.Future<_i2.Either<_i5.Failure, List<_i6.Produk>>>
      getListProductByCategory({required String? kategori}) =>
          (super.noSuchMethod(
            Invocation.method(
              #getListProductByCategory,
              [],
              {#kategori: kategori},
            ),
            returnValue:
                _i4.Future<_i2.Either<_i5.Failure, List<_i6.Produk>>>.value(
                    _FakeEither_0<_i5.Failure, List<_i6.Produk>>(
              this,
              Invocation.method(
                #getListProductByCategory,
                [],
                {#kategori: kategori},
              ),
            )),
            returnValueForMissingStub:
                _i4.Future<_i2.Either<_i5.Failure, List<_i6.Produk>>>.value(
                    _FakeEither_0<_i5.Failure, List<_i6.Produk>>(
              this,
              Invocation.method(
                #getListProductByCategory,
                [],
                {#kategori: kategori},
              ),
            )),
          ) as _i4.Future<_i2.Either<_i5.Failure, List<_i6.Produk>>>);
}
