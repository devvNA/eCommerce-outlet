import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:marvelindo_outlet/app/data/datasources/produk_remote_datasources.dart';
import 'package:marvelindo_outlet/app/data/models/produk_model.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

@GenerateNiceMocks([
  MockSpec<ProdukRemoteDataSource>(),
])
import 'produk_remote_datasources_test.mocks.dart';

void main() async {
  var listProduk = <Produk>[];
  var kategori = "kupon";

  final produkRemoteDataSource = MockProdukRemoteDataSource(); //Kelas Fake
  group("Produk Remote Data Source", () {
    group('Melakukan GET Data Produk', () {
      test('GET BERHASIL', () async {
        // Proses Stubbing
        when(produkRemoteDataSource.getAllProduk())
            .thenAnswer((_) async => Right(listProduk));
        // Tidak perlu membuat blok try-catch untuk kasus sukses
        final response = await produkRemoteDataSource.getAllProduk();
        // Gunakan fold untuk mengakses nilai Right
        final dataProduk = response.fold((failure) => null, (data) => data);
        expect(dataProduk, listProduk);
      });
      test('GET GAGAL', () async {
        when(produkRemoteDataSource.getAllProduk()).thenThrow(Exception());
        try {
          await produkRemoteDataSource.getAllProduk();
          fail("Tidak mungkin terjadi");
          //Tidak mungkin terjadi error
        } catch (e) {
          //Testing untuk kegagalan
          expect(e, isException);
        }
      });
    });
    group('Melakukan GET Data Produk by Kategori', () {
      test('GET BERHASIL', () async {
        // Proses Stubbing
        when(produkRemoteDataSource.getListProductByCategory(
                kategori: kategori))
            .thenAnswer((_) async => Right(listProduk));
        // Tidak perlu membuat blok try-catch untuk kasus sukses
        final response = await produkRemoteDataSource.getListProductByCategory(
            kategori: kategori);
        // Gunakan fold untuk mengakses nilai Right
        final dataProduk = response.fold((failure) => null, (data) => data);
        expect(dataProduk, listProduk);
      });
      test('GET GAGAL', () async {
        when(produkRemoteDataSource.getListProductByCategory(
                kategori: kategori))
            .thenThrow(Exception());
        try {
          await produkRemoteDataSource.getListProductByCategory(
              kategori: kategori);
          fail("Tidak mungkin terjadi");
          //Tidak mungkin terjadi error
        } catch (e) {
          //Testing untuk kegagalan
          expect(e, isException);
        }
      });
    });
  });
}
