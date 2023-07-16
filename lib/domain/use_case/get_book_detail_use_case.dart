import 'package:flutter_app/data/model/book_detail_response.dart';
import 'package:flutter_app/domain/repository/book_repository.dart';

class GetBookDetailUseCase {
  final BookRepository repository;

  GetBookDetailUseCase({required this.repository});

  Future<BookDetailResponse> call(String isbn13) async =>
      await repository.getBookDetail(isbn13);
}
