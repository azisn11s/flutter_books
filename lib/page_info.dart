import 'package:flutter/material.dart';
import 'package:flutter_app/main.dart';
import 'package:flutter_app/page_home.dart';

class InfoPage extends StatelessWidget {
  const InfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          const Text('Here you are on the Info Page.'),
          const SizedBox(
            height: 10,
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return const HomePage();
                  },
                ));
              },
              child: const Text('Back To Homepage'))
        ]),
      ),
    );
  }
}
