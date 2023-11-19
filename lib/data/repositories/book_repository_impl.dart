import 'package:dartz/dartz.dart';

import '../../core/networking/failure.dart';
import '../../domain/repositories/book_repository.dart';
import '../datasources/book _remote_datasources.dartbook_remote_data_source.dart';
import '../../core/types.dart';



class BookRepositoryImpl implements BookRepository {
  final BookRemoteDataSource remoteDataSource;

  BookRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, ListBook>> getListBook(int page, int limit) async =>
      await remoteDataSource.getListBook(page, limit);
}
