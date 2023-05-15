import 'package:flutter/material.dart';
import 'package:quiz_app/services/firestore.dart';
import 'package:quiz_app/services/models.dart';
import 'package:quiz_app/shared/bottom_nav.dart';
import 'package:quiz_app/topics/topic_item.dart';

class TopicsScreen extends StatelessWidget {
  const TopicsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Topic>>(
        future: FirestoreService().getTopics(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
          } else if (snapshot.hasError) {
          } else if (snapshot.hasData) {
            var topics = snapshot.data;
            return Scaffold(
              appBar: AppBar(
                  backgroundColor: Colors.deepOrange,
                  title: const Text('Topics')),
              body: GridView.count(
                primary: false,
                padding: const EdgeInsets.all(20.0),
                crossAxisCount: 2,
                crossAxisSpacing: 10.0,
                children:
                    topics.map((topic) => TopicItem(topic: topic).toList()),
              ),
              bottomNavigationBar: const BottomNavBar(),
            );
          } else {
            return const Text('No topics foung in Firestore. Check database.');
          }
        });
  }
}
