import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: NewsList(),
      ),
    );
  }
}

class ProfileIcon extends StatelessWidget {
  const ProfileIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        alignment: Alignment.topRight,
        clipBehavior: Clip.hardEdge,
        children: [
          Container(
            width: 120,
            height: 120,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.black,
            ),
          ),
          Container(
            width: 35,
            height: 35,
            padding: const EdgeInsets.all(5),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
            child: Container(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.red,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TopBar extends StatelessWidget {
  const TopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Today\'s News',
          style: TextStyle(fontSize: 30),
        ),
        Text(
          '${DateFormat.EEEE().format(DateTime.now())}, ${DateFormat.d().format(DateTime.now())} ${DateFormat.MMMM().format(DateTime.now())} ${DateFormat.y().format(DateTime.now())}',
          style: const TextStyle(fontSize: 10, color: Colors.grey),
        ),
      ],
    );
  }
}

class NewsList extends StatelessWidget {
  const NewsList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: <Widget>[
        const TopBar(),
        const Text(
          'Latest News',
          style: TextStyle(
            height: 3,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
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
        Row(
          mainAxisAlignment: MainAxisAlignment.values[3],
          children: <Widget>[
            Container(
              color: Colors.white,
              child: const Text(
                'Hot News',
                style: TextStyle(
                  height: 3,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              color: Colors.white,
              child: const Text(
                'View All',
                style: TextStyle(
                  color: Colors.grey,
                  height: 3,
                  fontSize: 12,
                ),
              ),
            ),
          ],
        ),
        ListTile(
          leading: ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: const AspectRatio(
              aspectRatio: 8 / 7,
              child: Image(
                image: AssetImage('assets/images/batik1.jpg'),
                fit: BoxFit.cover, // use this
              ),
            ),
          ),
          title: const Text(
            'Batik Mendunia oleh Badan Nasional Pengelola Batik',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Text(
            '${DateFormat.EEEE().format(DateTime.now())}, ${DateFormat.d().format(DateTime.now())} ${DateFormat.MMMM().format(DateTime.now())} ${DateFormat.y().format(DateTime.now())} | 4 hours ago',
            style: const TextStyle(
              fontSize: 12,
              color: Colors.grey,
            ),
          ),
          // trailing: const Icon(Icons.favorite),
        ),
        ListTile(
          leading: ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: const AspectRatio(
              aspectRatio: 8 / 7,
              child: Image(
                image: AssetImage('assets/images/batik2.jpg'),
                fit: BoxFit.cover, // use this
              ),
            ),
          ),
          title: const Text(
            'Batik Mendunia oleh Badan Nasional Pengelola Batik',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Text(
            '${DateFormat.EEEE().format(DateTime.now())}, ${DateFormat.d().format(DateTime.now())} ${DateFormat.MMMM().format(DateTime.now())} ${DateFormat.y().format(DateTime.now())} | 4 hours ago',
            style: const TextStyle(
              fontSize: 12,
              color: Colors.grey,
            ),
          ),
          // trailing: const Icon(Icons.favorite),
        ),
        ListTile(
          leading: ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: const AspectRatio(
              aspectRatio: 8 / 7,
              child: Image(
                image: AssetImage('assets/images/batik3.jpg'),
                fit: BoxFit.cover, // use this
              ),
            ),
          ),
          title: const Text(
            'Batik Mendunia oleh Badan Nasional Pengelola Batik',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Text(
            '${DateFormat.EEEE().format(DateTime.now())}, ${DateFormat.d().format(DateTime.now())} ${DateFormat.MMMM().format(DateTime.now())} ${DateFormat.y().format(DateTime.now())} | 4 hours ago',
            style: const TextStyle(
              fontSize: 12,
              color: Colors.grey,
            ),
          ),
          // trailing: const Icon(Icons.favorite),
        ),
      ],
    );
  }
}
