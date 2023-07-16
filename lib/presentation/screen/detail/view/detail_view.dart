import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/data/data_source/remote/book_remote.dart';
import 'package:flutter_app/data/repository/book_repository_implementation.dart';
import 'package:flutter_app/domain/use_case/get_book_detail_use_case.dart';
import 'package:flutter_app/presentation/screen/detail/controller/detail_controller.dart';
import 'package:get/get.dart';

class DetailView extends StatelessWidget {
  DetailView({super.key, required this.isbn13});
  final String isbn13;

  final getBookDetailController = DetailController(
    getDetailBookUseCase: GetBookDetailUseCase(
      repository: BookRepositoryImplementation(
        remoteDataSource: BookRemoteDataSource(
          client: Dio(),
        ),
      ),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<DetailController>(
        init: getBookDetailController,
        initState: (state) => getBookDetailController.getDetailBook(isbn13),
        builder: (state) {
          if (state.detailState.value.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return Center(
              child: Text(state.detailBook.value.authors ?? 'No Author'));
        },
      ),
    );
  }
}
