import 'package:flutter/material.dart';

import 'Screen/First.dart';
import 'Screen/Second.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const HomePage(),
        'first': (context) => const First(),
        'second': (context) => const Second(),
      },
    ),
  );
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              "https://a3h4z5g5.rocketcdn.me/wp-content/uploads/2020/10/image22-1024x728.jpeg.webp",
              fit: BoxFit.cover,
            ),
            const SizedBox(
              height: 200,
            ),
            const Text(
              "To-Do List",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
                color: Colors.black,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Padding(
              padding: EdgeInsets.only(
                right: 16,
                left: 16,
              ),
              child: Text(
                "This Product tool is designed to manage your day Task.",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                  fontSize: 20,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed("first");
                  },
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Add Project"),
                      Icon(
                        Icons.arrow_forward,
                      ),
                    ],
                  )),
            )
          ],
        ),
      ),
    );
  }
}
