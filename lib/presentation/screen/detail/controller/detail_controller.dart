import 'package:flutter_app/data/model/book_detail_response.dart';
import 'package:flutter_app/domain/use_case/get_book_detail_use_case.dart';
import 'package:flutter_app/presentation/state/view_state.dart';
import 'package:get/get.dart';

class DetailController extends GetxController {
  final GetBookDetailUseCase getDetailBookUseCase;

  DetailController({required this.getDetailBookUseCase});

  Rx<ViewState> detailState = Rx(ViewState.initial);
  Rx<BookDetailResponse> detailBook = Rx(BookDetailResponse());

  void getDetailBook(String isbn13) async {
    detailState(ViewState.loading);
    update();

    final result = await getDetailBookUseCase.call(isbn13);
    detailBook(result);
    update();

    detailState(ViewState.success);
    update();
  }
}
