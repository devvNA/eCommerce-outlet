import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:marvelindo_outlet/app/data/datasources/keranjang_remote_datasources.dart';
import 'package:marvelindo_outlet/app/data/models/keranjang_model.dart';
import 'package:marvelindo_outlet/app/data/models/produk_model.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

@GenerateNiceMocks([
  MockSpec<KeranjangRemoteDataSource>(),
  // MockSpec<Request>(),
])
import 'keranjang_remote_datasources_test.mocks.dart';

void main() async {
  final keranjangRemoteDataSource =
      MockKeranjangRemoteDataSource(); //Kelas Fake
  // MockRequest mockRequest = MockRequest();
  // final keranjangRemoteDataSourceImpl =
  //     KeranjangRemoteDataSourceImpl(client: mockRequest); //Kelas Fake
  var listKeranjang = <Keranjang>[];
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
  // String url = "http://scm8.satriatech.com/api/admin ";

  group("Keranjang Remote Data Source", () {
    group('Melakukan GET Data Keranjang', () {
      test('GET BERHASIL', () async {
        // Proses Stubbing
        when(keranjangRemoteDataSource.getListKeranjang())
            .thenAnswer((_) async => Right(listKeranjang));
        // Tidak perlu membuat blok try-catch untuk kasus suksesa
        final response = await keranjangRemoteDataSource.getListKeranjang();
        // Gunakan fold untuk mengakses nilai Right
        final dataKeranjang = response.fold((failure) => null, (data) => data);
        expect(dataKeranjang, listKeranjang);
      });
      test('GET GAGAL', () async {
        when(keranjangRemoteDataSource.getListKeranjang())
            .thenThrow(Exception());
        try {
          await keranjangRemoteDataSource.getListKeranjang();
          fail("Tidak mungkin terjadi");
          //Tidak mungkin terjadi error
        } catch (e) {
          //Testing untuk kegagalan
          expect(e, isException);
        }
      });
    });
// ========================================================================= //
    group('Melakukan POST ke keranjang', () {
      test('POST BERHASIL', () async {
        // Proses Stubbing
        when(keranjangRemoteDataSource.addToCart(idOutlet: id, produk: produk))
            .thenAnswer((_) async => Right(messageServer));
        // Tidak perlu membuat blok try-catch untuk kasus sukses
        final response = await keranjangRemoteDataSource.addToCart(
            idOutlet: id, produk: produk);
        // Gunakan fold untuk mengakses nilai Right
        final messageData = response.fold((failure) => null, (data) => data);
        expect(messageData, messageServer);
      });
      test('POST GAGAL', () async {
        when(keranjangRemoteDataSource.addToCart(idOutlet: id, produk: produk))
            .thenThrow(Exception());
        try {
          await keranjangRemoteDataSource.addToCart(
              idOutlet: id, produk: produk);
          fail("Tidak mungkin terjadi");
          //Tidak mungkin terjadi error
        } catch (e) {
          //Testing untuk kegagalan
          expect(e, isException);
        }
      });
    });
// ========================================================================= //
    group('Melakukan UPDATE Kuantitas Keranjang', () {
      test('UPDATE BERHASIL', () async {
        // Proses Stubbing
        when(keranjangRemoteDataSource.updateItemKeranjang(id, qty))
            .thenAnswer((_) async => Right(messageServer));
        // Tidak perlu membuat blok try-catch untuk kasus sukses
        final response =
            await keranjangRemoteDataSource.updateItemKeranjang(id, qty);
        // Gunakan fold untuk mengakses nilai Right
        final messageData = response.fold((failure) => null, (data) => data);
        expect(messageData, messageServer);
      });
      test('UPDATE GAGAL', () async {
        when(keranjangRemoteDataSource.updateItemKeranjang(id, qty))
            .thenThrow(Exception());
        try {
          await keranjangRemoteDataSource.updateItemKeranjang(id, qty);
          fail("Tidak mungkin terjadi");
          //Tidak mungkin terjadi error
        } catch (e) {
          //Testing untuk kegagalan
          expect(e, isException);
        }
      });
    });
    // ========================================================================= //
    group('Melakukan DELETE Produk Keranjang()', () {
      test('DELETE BERHASIL', () async {
        // Proses Stubbing
        when(keranjangRemoteDataSource.deleteItemKeranjang(id))
            .thenAnswer((_) async => Right(messageServer));
        final response =
            await keranjangRemoteDataSource.deleteItemKeranjang(id);
        // Gunakan fold untuk mengakses nilai Right
        final messageData = response.fold((failure) => null, (data) => data);
        expect(messageData, messageServer);
      });
      test('DELETE GAGAL', () async {
        when(keranjangRemoteDataSource.deleteItemKeranjang(id))
            .thenThrow(Exception());
        try {
          await keranjangRemoteDataSource.deleteItemKeranjang(id);
          fail("Tidak mungkin terjadi");
          //Tidak mungkin terjadi error
        } catch (e) {
          //Testing untuk kegagalan
          expect(e, isException);
        }
      });
    });
  });
  // ========================================================================= //

/*   group('Keranjang Remote Data Source Implementation', () {
    group('getListKeranjang()', () {
      final mockResponse = {
        "data": [
          {"id": 1, "nama": "Produk 1", "harga": 10000},
          {"id": 2, "nama": "Produk 2", "harga": 15000},
        ]
      };
      test('BERHASIL', () async {
        // Proses Stubbing
        when(mockRequest.get(url, requiresAuthToken: false)).thenAnswer(
          (_) async => Response(
              requestOptions: RequestOptions(path: url),
              data: mockResponse,
              statusCode: 200),
        );
        final response = await keranjangRemoteDataSourceImpl.getListKeranjang();
        // Gunakan fold untuk mengakses nilai Right
        response.fold((failure) => null, (data) {
          expect(data.length, 2);
          expect(data[0].idProduk, 1);
          expect(data[0].namaBarang, 'Produk 1');
          expect(data[0].hargaBarang, 10000);
          expect(data[1].idProduk, 2);
          expect(data[1].idProduk, 'Produk 2');
          expect(data[1].hargaBarang, 15000);
        });
      });
      test('GAGAL', () async {
        // Proses Stubbing
        // Stub permintaan GET ke server untuk mengembalikan respons gagal
        when(mockRequest.get(url, requiresAuthToken: false))
            .thenThrow(Exception());

        try {
          final response =
              await keranjangRemoteDataSourceImpl.getListKeranjang();
          response.fold((failure) => failure, (data) => data);

          // when(mockRequest.get(url, requiresAuthToken: false)).thenAnswer(
          //   (_) async => Response(
          //       requestOptions: RequestOptions(path: url),
          //       data: mockResponse,
          //       statusCode: 404),
          fail("Tidak mungkin terjadi");
          //Tidak mungkin terjadi error
        } catch (e) {
          //Testing untuk kegagalan
          expect(e, isException);
        }
      });
    });
  });
 */
}
