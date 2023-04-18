import 'package:flutter/material.dart';
import 'tweets.dart';
import 'tweet.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Twitter",
      theme: ThemeData(
        primaryColor: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const Twitter(),
    );
  }
}

class Twitter extends StatefulWidget {
  const Twitter({super.key});

  @override
  State<Twitter> createState() => _TwitterState();
}

class _TwitterState extends State<Twitter> {
  _callback(String text) {
    setState(() {
      tweets.insert(
        0,
        Tweet(
          avatar_url:
              'https://th.bing.com/th/id/R.41bb461836cf3c46be83d1b5efe9bdb9?rik=3z9x0SfyOZEXgQ&pid=ImgRaw&r=0',
          postText: text,
          isImage: false,
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 3,
        leading: Container(
          margin: const EdgeInsets.all(10.0),
          child: const CircleAvatar(
            backgroundImage: AssetImage("images/profile.jpg"),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.star_border_outlined,
              color: Colors.grey,
            ),
          )
        ],
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Image(
          image: NetworkImage(
              'https://th.bing.com/th/id/R.91c116d019ccc8c7279dbed729d54826?rik=rmxrdrGw1W9LNQ&pid=ImgRaw&r=0'),
          height: 30.0,
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 30,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              icon: const Icon(Icons.account_circle),
              onPressed: () {},
            )
          ],
        ),
      ),
      body: Container(
        child: listOfTweets(),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.plus_one),
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => NewTweet(
                  callback: _callback,
                ),
              ));
        },
      ),
    );
  }

  Widget listOfTweets() {
    return Container(
      color: Colors.white,
      child: ListView.separated(
        itemBuilder: (BuildContext context, int index) {
          return tweets[index];
        },
        separatorBuilder: (BuildContext context, int index) => const Divider(
          height: 10,
        ),
        itemCount: tweets.length,
      ),
    );
  }
}

// ignore: must_be_immutable
class NewTweet extends StatelessWidget {
  final ValueChanged<String> callback;
  TextEditingController tweetController = TextEditingController();
  NewTweet({super.key, required this.callback});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Twitter",
      theme: ThemeData(
        primaryColor: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: AppBar(
          elevation: 3,
          leading: Container(
            margin: const EdgeInsets.all(10.0),
            child: const CircleAvatar(
              backgroundImage: AssetImage("images/profile.jpg"),
            ),
          ),
          backgroundColor: Colors.white,
          centerTitle: true,
          title: const Text(
            "Home",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: Column(
          children: [
            TextField(
              controller: tweetController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "What's happening",
                hintStyle: TextStyle(color: Colors.grey),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                callback(tweetController.text);
                Navigator.pop(context);
              },
              child: const Text('Tweet'),
            ),
          ],
        ),
      ),
    );
  }
}
