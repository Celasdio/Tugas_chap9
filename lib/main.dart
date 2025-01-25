import 'package:flutter/material.dart';
import 'package:tugas9new/model/Getnews.dart'; // Sesuaikan lokasi Getnews.dart Anda
import 'package:tugas9new/home/apiPage/Detailnewspage.dart'; // Sesuaikan lokasi Detailnewspage.dart Anda
import 'package:tugas9new/home/Newspage.dart'; // Sesuaikan lokasi Newspage.dart Anda

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'News App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Newspage(),
    );
  }
}
