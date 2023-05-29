import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About the App'),
      ),
      body: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                style: Theme.of(context).textTheme.bodyLarge,
                'The Firebase-Flutter Quiz Application is a user-friendly mobile app designed to quiz users on basic coding concepts. The app utilizes the Firebase platform for storing quiz questions and tracking user progress. It offers an interactive and engaging way for users to test their coding knowledge. This project is Jeff\'s study on how to implement a realtime database with flutter. ',
              )
            ],
          )),
    );
  }
}
