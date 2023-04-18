import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Tweet extends StatelessWidget {
  // ignore: non_constant_identifier_names
  final String avatar_url;
  final String postText;
  final bool isImage;

  const Tweet({
    super.key,
    // ignore: non_constant_identifier_names
    required this.avatar_url,
    required this.isImage,
    required this.postText,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        tweetAvatar(),
        tweetBody(),
      ],
    );
  }

  Widget tweetAvatar() {
    return Container(
      margin: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage(avatar_url),
          ),
        ],
      ),
    );
  }

  Widget tweetHeader() {
    return Row(
      children: [
        Container(
          margin: const EdgeInsets.only(
            right: 5.0,
          ),
          child: const Text(
            'Bangkok University',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const Text(
          '@Engineering 10s',
          style: TextStyle(
            color: Colors.grey,
          ),
        ),
        const Spacer(),
        IconButton(
          onPressed: () {},
          icon: const Icon(
            FontAwesomeIcons.angleDown,
            size: 14.0,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }

  Widget tweetText(String text) {
    return Text(
      text,
      overflow: TextOverflow.clip,
    );
  }

  Widget tweetImage(String text) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image(
          image: NetworkImage(avatar_url),
          width: 400,
        ),
        const SizedBox(
          height: 10.0,
        ),
        Text(
          text,
          overflow: TextOverflow.clip,
          textAlign: TextAlign.start,
        ),
      ],
    );
  }

  Widget tweetBody() {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          tweetHeader(),
          isImage ? tweetImage(postText) : tweetText(postText),
          tweetButton(),
        ],
      ),
    );
  }

  Widget tweetButton() {
    return Container(
      margin: const EdgeInsets.only(top: 10.0, right: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const Icon(
                Icons.message,
                size: 18.0,
                color: Colors.black45,
              ),
              Container(
                margin: const EdgeInsets.all(6.0),
                child: const Text(
                  "345",
                  style: TextStyle(
                    color: Colors.black45,
                    fontSize: 14.0,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
