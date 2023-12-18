import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About'),
      ),

    body: const Column(
      children: [
        Image(),
        TextWidget(),
      ],
    ),
    );
  }
}

class Image extends StatelessWidget {
  const Image({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 200,
        height: 200,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(200)),
          image: DecorationImage(
            fit: BoxFit.fitHeight,
            image: AssetImage("assets/images/profile_pic.jpg"),
          ),
        ),
      ),
    );
  }
}


class TextWidget extends StatelessWidget {
  const TextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView(
        shrinkWrap: true,
        children: [
          const SizedBox(height: 16),
          const Center(
            child: Text(
              'random picker',
              style: TextStyle(
                fontSize: 64,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 4),
          const Center(
            child: Text(
              'made with ❤️ by smallbottle',
              style: TextStyle(
                fontSize: 24,
                color: Colors.grey,
              ),
            ),
          ),
          const SizedBox(height: 4),
          Center(
            child: IconButton(
              onPressed: () {
                launchUrl(Uri.parse(
                    'https://github.com/0123-smallbottle/random_picker'));
              },
              icon: const Icon(FontAwesomeIcons.github),
              iconSize: 64,
            ),
          ),
        ],
      ),
    );
  }
}
