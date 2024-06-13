// ignore_for_file: unused_local_variable, unused_import

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:marvelindo_outlet/app/core/api_endpoints.dart';
import 'package:marvelindo_outlet/app/data/datasources/pemesanan_remote_datasources.dart';
import 'package:marvelindo_outlet/app/data/models/keranjang_model.dart';
import 'package:marvelindo_outlet/app/data/models/pemesanan_model.dart';
import 'package:marvelindo_outlet/app/data/models/produk_model.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

@GenerateNiceMocks([
  MockSpec<PemesananRemoteDataSource>(),
])
import 'pemesanan_remote_datasources_test.mocks.dart';

void main() async {
  int idOutlet = 1;
  String tanggal = "Da";
  String tipePayment = "COD";
  int total = 10;

  final pemesananRemoteDataSource =
      MockPemesananRemoteDataSource(); //Kelas Fake
  // MockRequest mockRequest = MockRequest();
  // final keranjangRemoteDataSourceImpl =
  //     KeranjangRemoteDataSourceImpl(client: mockRequest); //Kelas Fake
  var listPemesanan = <Pemesanan>[];
  var produkKeranjang = <Keranjang>[];
  const int id = 1;
  String messageServer = "message server";
  Produk produk = Produk(
    id: 1,
    deskripsi: "deskripsi produk",
    gambar:
        "https://res.cloudinary.com/dotz74j1p/raw/upload/v1716044999/t3jxwmbgwelsvgsmby4c.png",
    harga: 10000,
    jenisBarang: "Kupon",
    nama: "nama produk",
    stok: 5,
  );
  int qty = 1;

  group("Pemesanan Remote Data Source", () {
    group('Melakukan GET Data Pemesanan', () {
      test('GET BERHASIL', () async {
        // Proses Stubbing
        when(pemesananRemoteDataSource.getListHistoriPemesanan())
            .thenAnswer((_) async => Right(listPemesanan));
        // Tidak perlu membuat blok try-catch untuk kasus sukses
        final response =
            await pemesananRemoteDataSource.getListHistoriPemesanan();
        // Gunakan fold untuk mengakses nilai Right
        final dataKeranjang = response.fold((failure) => null, (data) => data);
        expect(dataKeranjang, listPemesanan);
      });
      test('GET GAGAL', () async {
        when(pemesananRemoteDataSource.getListHistoriPemesanan())
            .thenThrow(Exception());
        try {
          await pemesananRemoteDataSource.getListHistoriPemesanan();
          fail("Tidak mungkin terjadi");
          //Tidak mungkin terjadi error
        } catch (e) {
          //Testing untuk kegagalan
          expect(e, isException);
        }
      });
    });
// ========================================================================= //
    group('Melakukan POST Pemesanan', () {
      test('POST BERHASIL', () async {
        // Proses Stubbing
        when(pemesananRemoteDataSource.postPemesanan(
          idOutlet: idOutlet,
          tanggal: tanggal,
          tipePayment: tipePayment,
          total: total,
          produkKeranjang: produkKeranjang,
        )).thenAnswer((_) async => Right(messageServer));
        // Tidak perlu membuat blok try-catch untuk kasus sukses
        final response = await pemesananRemoteDataSource.postPemesanan(
            idOutlet: idOutlet,
            tanggal: tanggal,
            tipePayment: tipePayment,
            total: total,
            produkKeranjang: produkKeranjang);
        // Gunakan fold untuk mengakses nilai Right
        final messageData = response.fold((failure) => null, (data) => data);
        expect(messageData, messageServer);
      });
      test('POST GAGAL', () async {
        when(pemesananRemoteDataSource.postPemesanan(
                idOutlet: idOutlet,
                tanggal: tanggal,
                tipePayment: tipePayment,
                total: total,
                produkKeranjang: produkKeranjang))
            .thenThrow(Exception());
        try {
          await pemesananRemoteDataSource.postPemesanan(
              idOutlet: idOutlet,
              tanggal: tanggal,
              tipePayment: tipePayment,
              total: total,
              produkKeranjang: produkKeranjang);
          fail("Tidak mungkin terjadi");
          //Tidak mungkin terjadi error
        } catch (e) {
          //Testing untuk kegagalan
          expect(e, isException);
        }
      });
    });
// ========================================================================= //
  });
  // ========================================================================= //
}
