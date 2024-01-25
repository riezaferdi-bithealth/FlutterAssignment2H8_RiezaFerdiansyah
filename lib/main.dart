import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutterassignment2h8_riezaferdiansyah/detail_page.dart';
import './api/news_service.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: NewsBody(),
        bottomNavigationBar: BottomBar(),
      ),
      debugShowCheckedModeBanner: false,
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
        TopBar(),
        Text(
          'Latest News',
          style: TextStyle(
            height: 3,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        LatestNews(),
        HotNews(),
        ListNews(),
        //NewsAPIList(),
      ],
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
            width: 50,
            height: 50,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.black,
            ),
          ),
          Container(
            width: 25,
            height: 25,
            padding: const EdgeInsets.all(4),
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
      //crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 30),
        Row(
          mainAxisAlignment: MainAxisAlignment.values[3],
          children: [
            Container(
                child: Column(
              children: [
                const Text(
                  'Today\'s News',
                  style: TextStyle(fontSize: 30),
                ),
                Text(
                  '${DateFormat.EEEE().format(DateTime.now())}, ${DateFormat.d().format(DateTime.now())} ${DateFormat.MMMM().format(DateTime.now())} ${DateFormat.y().format(DateTime.now())}',
                  style: const TextStyle(fontSize: 15, color: Colors.grey),
                ),
              ],
            )),
            Container(
              child: ProfileIcon(),
            ),
          ],
        ),
      ],
    );
  }
}

class ListNews extends StatelessWidget {
  const ListNews({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const DetailPage(),
          ),
        );
      },
      child: ListTile(
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(10.0),
          child: const AspectRatio(
            aspectRatio: 8 / 7,
            child: Image(
              image: AssetImage('assets/images/batik2.jpg'),
              fit: BoxFit.cover,
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
      ),
    );
  }
}

class LatestNews extends StatelessWidget {
  const LatestNews({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const DetailPage(),
          ),
        );
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
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
        ],
      ),
    );
  }
}

class HotNews extends StatelessWidget {
  const HotNews({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
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
    );
  }
}

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: index,
      onTap: (value) {
        print(value);
        setState(() {
          index = value;
        });
      },
      items: const [
        BottomNavigationBarItem(
          label: 'Home',
          icon: Icon(Icons.home),
        ),
        BottomNavigationBarItem(
          label: 'Profile',
          icon: Icon(Icons.account_circle),
        ),
        BottomNavigationBarItem(
          label: 'Settings',
          icon: Icon(Icons.settings),
        ),
      ],
    );
  }
}

class NewsAPIList extends StatefulWidget {
  const NewsAPIList({super.key});

  @override
  State<NewsAPIList> createState() => _NewsAPIListState();
}

class _NewsAPIListState extends State<NewsAPIList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder(
          future: getNewsData(),
          builder: (context, snapshot) {
            print(snapshot);
            if (snapshot.connectionState == ConnectionState.done) {
              return ListView.builder(
                itemCount: snapshot.data?.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading:
                        Image.asset(snapshot.data?[index].urlToImage! ?? '_'),
                    title: Text(snapshot.data?[index].title! ?? '_'),
                    subtitle: Text(
                        "By ${snapshot.data?[index].author! ?? '_'} on ${snapshot.data?[index].publishedAt! ?? '_'}"),
                    trailing: Text(snapshot.data?[index].content! ?? '_'),
                  );
                },
              );
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }
            // By default, show a loading spinner.
            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
