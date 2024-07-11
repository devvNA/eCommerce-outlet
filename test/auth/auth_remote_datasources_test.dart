import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:marvelindo_outlet/app/data/datasources/auth_remote_datasources.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

@GenerateNiceMocks([
  MockSpec<AuthRemoteDataSource>(),
])
import 'auth_remote_datasources_test.mocks.dart';

void main() async {
  final authRemoteDataSource = MockAuthRemoteDataSource(); //Kelas Fake

  group("Auth Remote Data Source", () {
    group('Melakukan POST Login', () {
      test('POST BERHASIL', () async {
        // Proses Stubbing
        when(authRemoteDataSource.googleLogin())
            .thenAnswer((data) async => const Right(""));
        // Tidak perlu membuat blok try-catch untuk kasus suksesa
        final response = await authRemoteDataSource.googleLogin();
        // Gunakan fold untuk mengakses nilai Right
        final dataLogin = response.fold((failure) => null, (data) => data);
        expect(dataLogin, "");
      });
      test('POST GAGAL', () async {
        when(authRemoteDataSource.googleLogin()).thenThrow(Exception());
        try {
          await authRemoteDataSource.googleLogin();
          fail("Tidak mungkin terjadi");
          //Tidak mungkin terjadi error
        } catch (e) {
          //Testing untuk kegagalan
          expect(e, isException);
        }
      });
    });

    group('Melakukan POST Logout', () {
      test('POST BERHASIL', () async {
        // Proses Stubbing
        when(authRemoteDataSource.googleLogout())
            .thenAnswer((realInvocation) async {
          // Add your logic here
          return Future.value(null);
        });
        // Tidak perlu membuat blok try-catch untuk kasus suksesa
        await authRemoteDataSource.googleLogout();
        // Gunakan fold untuk mengakses nilai Right
        expect(true, true);
      });
      test('POST GAGAL', () async {
        when(authRemoteDataSource.googleLogout()).thenThrow(Exception());
        try {
          await authRemoteDataSource.googleLogout();
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
