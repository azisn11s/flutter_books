import 'package:flutter_app/data/model/book_model.dart';

abstract class BookRepository {
  Future<List<Book>> getBooks();
}
