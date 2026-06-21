import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
      home: const Scaffold(body: Column(children: [GreenBox(), RedBox()])),
    );
  }
}

class RedBox extends StatelessWidget {
  // RedBox la 1 widget bat bien -> khong thay doi
  // super.key là cú pháp để tạo 1 stateless widget

  const RedBox({super.key});
  @override
  // buildcontext vị trí của 1 widget ở trong ứng dụng
  // build là 1 hàm để vẽ giao diện
  Widget build(BuildContext context) {
    // return là trả về configuration của widget
    return Center(
      child: Container(
        margin: const EdgeInsets.all(10.0),
        color: const Color.fromARGB(255, 255, 0, 0),
        width: 48.0,
        height: 48.0,
      ),
    );
  }
}

class GreenBox extends StatelessWidget {
  const GreenBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.all(10.0),
        color: const Color.fromARGB(255, 0, 255, 64),
        width: 100.0,
        height: 48.0,
      ),
    );
  }
}
