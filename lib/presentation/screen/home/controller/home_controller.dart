import 'package:flutter_app/data/model/book_model.dart';
import 'package:flutter_app/domain/use_case/get_books_use_case.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final GetBooksUseCase getBooksUseCase;

  HomeController({required this.getBooksUseCase});

  Rx<List<Book>> listBook = Rx([]);

  void getBooks() async {
    final listBooks = await getBooksUseCase.call();
    listBook(listBooks);
    update();
  }
}
