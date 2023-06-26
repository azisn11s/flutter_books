import 'package:flutter_app/domain/repository/book_repository.dart';

import '../../data/model/book_model.dart';

class GetBooksUseCase {
  final BookRepository repository;

  GetBooksUseCase({required this.repository});

  Future<List<Book>> call() async => await repository.getBooks();
}
