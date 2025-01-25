import 'package:flutter/material.dart';
import 'package:tugas9new/model/Getnews.dart'; // Sesuaikan lokasi file Getnews.dart Anda
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

import 'package:tugas9new/home/apiPage/NewsCard.dart'; // Sesuaikan lokasi file NewsCard.dart Anda

class Newspage extends StatefulWidget {
  const Newspage({Key? key}) : super(key: key);

  @override
  State<Newspage> createState() => _NewspageState();
}

class _NewspageState extends State<Newspage> {
  Future<List<Getnews>> fetchPosts() async {
    final response =
    await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));

    print(response.statusCode);
    print(response.body);

    if (response.statusCode == 200) {
      var getPostsData = json.decode(response.body) as List;
      var listPosts = getPostsData.map((i) => Getnews.fromJson(i)).toList();
      return listPosts;
    } else {
      throw Exception('Failed to load Posts');
    }
  }

  late Future<List<Getnews>> futurePosts;

  @override
  void initState() {
    super.initState();
    futurePosts = fetchPosts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Post List'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: FutureBuilder<List<Getnews>>(
            future: futurePosts,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.separated(
                  itemBuilder: (context, index) {
                    var post = (snapshot.data as List<Getnews>)[index];
                    return Column(
                      children: [
                        NewsCard(
                          getnews: Getnews(
                            id: post.id,
                            title: post.title,
                            body: post.body,
                          ),
                        ),
                        const SizedBox(height: 20),
                      ],
                    );
                  },
                  separatorBuilder: (context, index) =>
                  const Divider(), // Memisahkan item dengan garis
                  itemCount: (snapshot.data as List<Getnews>).length,
                );
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }
              return const CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}
