import 'package:flutter_app/data/model/book_model.dart';
import 'package:flutter_app/domain/use_case/get_books_use_case.dart';
import 'package:flutter_app/presentation/state/view_state.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final GetBooksUseCase getBooksUseCase;

  HomeController({required this.getBooksUseCase});

  Rx<List<Book>> listBook = Rx([]);
  Rx<ViewState> homeState = Rx(ViewState.initial);

  void getBooks() async {
    homeState(ViewState.loading);
    update();

    final listBooks = await getBooksUseCase.call();
    listBook(listBooks);
    homeState(ViewState.success);
    update();
  }
}
