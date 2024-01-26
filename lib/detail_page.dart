import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


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
    return ListView(
      padding: const EdgeInsets.all(16),
      children: const <Widget>[
        DetailNews(),
      ],
    );
  }
}

class DetailNews extends StatelessWidget {
  const DetailNews({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        ClipRRect(
          borderRadius: BorderRadius.circular(0),
          child: const Image(
            image: AssetImage('assets/images/batik1.jpg'),
          ),
        ),
        const Text(
          'Batik Mendunia oleh Badan Nasional Pengelola Batik',
          style: TextStyle(
            overflow: TextOverflow.clip,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          '${DateFormat.EEEE().format(DateTime.now())}, ${DateFormat.d().format(DateTime.now())} ${DateFormat.MMMM().format(DateTime.now())} ${DateFormat.y().format(DateTime.now())} | 4 hours ago',
          style: const TextStyle(
            fontSize: 12,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}
