import 'package:flutter/material.dart';
import 'package:flutter_app/page_detail.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Halaman Utama!'),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const DetailPage(),
                      ));
                },
                child: const Text('Go to detail page')),
          ],
        ),
      ),
    );
  }
}
