import 'package:flutter/material.dart';
import 'package:flutter_app/page_info.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Halaman Detail!'),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return const InfoPage();
                    },
                  ));
                },
                child: const Text('Go to Info Page!'))
          ],
        ),
      ),
    );
  }
}
