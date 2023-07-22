import 'package:flutter_app/data/model/book_detail_response.dart';
import 'package:flutter_app/data/model/book_model.dart';

abstract class BookRepository {
  Future<List<Book>> getBooks();
  Future<BookDetailResponse> getBookDetail(String isbn13);
  Future<BookDetailResponse> getBookDetailByName(String title);
}
