import 'package:dio/dio.dart';
import 'package:flutter_app/data/model/book_detail_response.dart';
import 'package:flutter_app/data/model/book_model.dart';
import 'package:flutter_app/data/model/book_response.dart';

class BookRemoteDataSource {
  final Dio client;
  const BookRemoteDataSource({required this.client});

  Future<List<Book>> getBooks() async {
    try {
      const url = 'https://api.itbook.store/1.0/new';
      final response = await client.get(url);
      BookResponse bookResponse = BookResponse.fromJson(response.data);
      List<Book> listBooks = bookResponse.books ?? [];

      return listBooks;
    } catch (e) {
      rethrow;
      // print(e.toString());
    }
  }

  Future<BookDetailResponse> getBookDetail(String isbn13) async {
    try {
      final url = 'https://api.itbook.store/1.0/books/$isbn13';
      final response = await client.get(url);
      BookDetailResponse bookResponse =
          BookDetailResponse.fromJson(response.data);

      return bookResponse;
    } catch (e) {
      rethrow;
      // print(e.toString());
    }
  }
}
