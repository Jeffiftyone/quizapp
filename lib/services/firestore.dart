import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rxdart/rxdart.dart';
import 'package:quiz_app/services/auth.dart';
import 'package:quiz_app/services//models.dart';

//fetching data
class FirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<List<Topic>> getTopics() async {
    var ref = _db.collection('topics');
    var snapshot = await ref.get();
    var data = snapshot.docs.map((s)=>s.data());
    var topics = data.map.((d)=> Topic.fromJson(d));
    return topics.toList();
  }

//basic data retrieval
Future<Quiz> getQuiz(String quizId) async {
  var ref= _db.collection('quizzes').doc(quizId);
  var snapshot = await ref.get();
  return Quiz.fromJson(snapshot.data() ?? {});
}

}
