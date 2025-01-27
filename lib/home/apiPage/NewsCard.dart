import 'package:flutter/material.dart';
import 'package:tugas9new/model/Getnews.dart';
import 'package:tugas9new/home/apiPage/Detailnewspage.dart';

class NewsCard extends StatelessWidget {
  const NewsCard({Key? key, required this.getnews}) : super(key: key);
  final Getnews getnews;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: ((context) {
              return DetailNewspage(getnews: getnews);
            }),
          ),
        );
      },
      child: Container(
        decoration: const BoxDecoration(color: Colors.white),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Text(posts.id.toString()),
            Text(
              getnews.title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(getnews.body),
          ],
        ),
      ),
    );
  }
}
