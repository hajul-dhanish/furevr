import 'package:cloud_firestore/cloud_firestore.dart';

Future<QuerySnapshot> getData() async {
  return await FirebaseFirestore.instance.collection('users').get();
}

Stream<QuerySnapshot> getUsersStream() {
  return FirebaseFirestore.instance.collection('grooming').snapshots();
}
