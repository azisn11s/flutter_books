import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/data/data_source/remote/book_remote.dart';
import 'package:flutter_app/data/repository/book_repository_implementation.dart';
import 'package:flutter_app/domain/use_case/get_books_use_case.dart';
import 'package:flutter_app/presentation/screen/home/controller/home_controller.dart';
import 'package:flutter_app/presentation/state/ViewState.dart';
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
            if (state.homeState.value == ViewState.loading) {
              return const Center(child: CircularProgressIndicator());
            }
            return ListView.builder(
                itemCount: state.listBook.value.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Card(
                      child: Padding(
                          padding: const EdgeInsets.all(9.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                state.listBook.value[index].title ?? 'No Title',
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(state.listBook.value[index].subtitle),
                            ],
                          )));
                });
          }),
    );
  }
}
