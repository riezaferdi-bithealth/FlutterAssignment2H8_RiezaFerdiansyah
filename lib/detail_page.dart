import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'controller/news_control.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detail Berita"),
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(Icons.arrow_back)),
      ),
      body: const NewsBody(),
    );
  }
}

class NewsBody extends StatelessWidget {
  const NewsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Consumer<NewsProvider>(builder: (_, cp, __) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(0),
              child: Image(
                image: NetworkImage(cp.selectedNews?.urlToImage ?? '_'),
              ),
            ),
            Text(
              cp.selectedNews?.title ?? '_',
              style: const TextStyle(
                overflow: TextOverflow.clip,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "By ${cp.selectedNews?.author ?? '_'} on ${cp.selectedNews?.publishedAt ?? '_'}",
              style: const TextStyle(
                fontSize: 12,
                color: Colors.grey,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              cp.selectedNews?.content ?? '_',
              style: const TextStyle(
                fontSize: 12,
                color: Colors.black,
              ),
            ),
          ],
        );
      }),
    );
  }
}
