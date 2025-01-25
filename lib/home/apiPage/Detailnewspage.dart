import 'package:flutter/material.dart';
import 'package:tugas9new/model/Getnews.dart';

class DetailNewspage extends StatelessWidget {
  final Getnews getnews;

  const DetailNewspage({Key? key, required this.getnews}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Page'),
      ), // AppBar
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'id: ${getnews.id}',
            ), // Text
            Text('Title: ${getnews.title}'),
            const SizedBox(
              height: 20,
            ), // SizedBox
            const Text('Body: '),
            Text(getnews.body),
          ],
        ), // Column
      ), // SafeArea
    ); // Scaffold
  }
}
