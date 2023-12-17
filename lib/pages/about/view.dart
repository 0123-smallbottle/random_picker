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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircleAvatar(
              radius: 128,
              backgroundImage: AssetImage('assets/images/profile_pic.jpg'),
            ),
            const SizedBox(height: 16),
            const Text(
              'random picker',
              style: TextStyle(
                fontSize: 64,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4),
            const Text(
              'made with ❤️ by smallbottle',
              style: TextStyle(
                fontSize: 24,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 4),
            IconButton(
              onPressed: () {
                launchUrl(Uri.parse('https://github.com/0123-smallbottle/random_picker'));
              },
              icon: const Icon(FontAwesomeIcons.github),
              iconSize: 64,
            ),
          ],
        ),
      ),
    );
  }
}
