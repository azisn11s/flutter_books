import 'package:flutter_app/data/data_source/remote/book_remote.dart';
import 'package:flutter_app/data/model/book_detail_response.dart';
import 'package:flutter_app/data/model/book_model.dart';
import 'package:flutter_app/domain/repository/book_repository.dart';

class BookRepositoryImplementation extends BookRepository {
  final BookRemoteDataSource remoteDataSource;

  BookRepositoryImplementation({required this.remoteDataSource});

  @override
  Future<List<Book>> getBooks() async {
    return await remoteDataSource.getBooks();
  }

  @override
  Future<BookDetailResponse> getBookDetail(String isbn13) async {
    return await remoteDataSource.getBookDetail(isbn13);
  }
}
