import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/data/data_source/remote/book_remote.dart';
import 'package:flutter_app/data/repository/book_repository_implementation.dart';
import 'package:flutter_app/domain/use_case/get_books_use_case.dart';
import 'package:flutter_app/presentation/screen/home/controller/home_controller.dart';
import 'package:get/get.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});

  final homeController = HomeController(
    getBooksUseCase: GetBooksUseCase(
      repository: BookRepositoryImplementation(
        remoteDataSource: BookRemoteDataSource(client: Dio()),
      ),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<HomeController>(
          init: homeController,
          initState: (state) => homeController.getBooks(),
          builder: (state) {
            return ListView.builder(
                itemCount: state.listBook.value.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Text(state.listBook.value[index].title);
                });
          }),
    );
  }
}
