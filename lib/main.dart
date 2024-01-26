import 'package:flutter/material.dart';
import 'controller/news_control.dart';
import 'package:intl/intl.dart';
import 'package:flutterassignment2h8_riezaferdiansyah/detail_page.dart';
import './api/news_service.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => NewsProvider(),
        )
      ],
      child: const MaterialApp(
        home: Scaffold(
          body: NewsBody(),
          bottomNavigationBar: BottomBar(),
        ),
        debugShowCheckedModeBanner: false,
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

class NewsBody extends StatelessWidget {
  const NewsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const TopBar(),
            const SizedBox(
              height: 10,
            ),
            // Latest News Widget
            Column(
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Latest News',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 220,
                  child: FutureBuilder(
                    future: getNewsData(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        //print(snapshot.data);
                        return ListView.builder(
                          shrinkWrap: true,
                          itemCount: snapshot.data?.length ?? 0,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
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
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Container(
                                    width: 250,
                                    height: 150,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      image: DecorationImage(
                                        fit: BoxFit.fill,
                                        image: NetworkImage(
                                          snapshot.data?[index].urlToImage! ??
                                              '_',
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    "${snapshot.data?[index].title!.substring(0, 27)}.." ?? '_',
                                    style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black87,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    "By ${snapshot.data?[index].author! ?? '_'} on ${snapshot.data?[index].publishedAt! ?? '_'}",
                                    style: const TextStyle(
                                      fontSize: 12,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      } else if (snapshot.hasError) {
                        return const Text("ERROR COI");
                      }
                      // By default, show a loading spinner.
                      return const CircularProgressIndicator();
                    },
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            const HotNews(),
            SizedBox(
              child: FutureBuilder(
                future: getNewsData(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: snapshot.data?.length ?? 0,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) {
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
                            title: Text(
                              snapshot.data?[index].title! ?? '_',
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                              ),
                              maxLines: 2,
                            ),
                            subtitle: Text(
                              "By ${snapshot.data?[index].author! ?? '_'} on ${snapshot.data?[index].publishedAt! ?? '_'}",
                              style: const TextStyle(
                                fontSize: 12,
                                color: Colors.grey,
                              ),
                            ),
                            leading: Container(
                              width: 70,
                              height: 120,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: NetworkImage(
                                    snapshot.data?[index].urlToImage! ?? '_',
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  } else if (snapshot.hasError) {
                    return const Text("Snapshot Error");
                  }
                  // By default, show a loading spinner.
                  return const CircularProgressIndicator();
                },
              ),
            )
          ],
        ),
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
