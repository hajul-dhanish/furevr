// import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:furevr/data/local/shared_pref.dart';
// import 'package:http/http.dart' as http;

class ApiService {
  String baseUrl = "";
  final FirebaseFirestore _auth = FirebaseFirestore.instance;

  // GET request
  Future<dynamic> get(String collection) async {
    try {
      List<Map<String, dynamic>> response = [];
      await _auth.collection(collection).get().then(
        (QuerySnapshot querySnapshot) {
          for (int i = 0; i < querySnapshot.docs.length; i++) {
            response.add(
              querySnapshot.docs[i].data() as Map<String, dynamic>,
            );
          }
        },
      );

      return response;
    } catch (e) {
      _handleError(e);
    }
  }

  // POST request
  Future<dynamic> post(String collection, Map<String, dynamic> data) async {
    try {
      await _auth.collection(collection).add(data);
    } catch (e) {
      _handleError(e);
    }
  }

  // POST request
  Future<void> update(String collection, Map<String, dynamic> data) async {
    try {
      var userId = await UserSharedPreferences().getUserIdPref();
      final String documentId = await getDocumentId(collection, userId) ?? "";
      await _auth.collection(collection).doc(documentId).update(data);
    } on FirebaseException catch (e) {
      _handleError(e.message);
    }
  }

  Future<String?> getDocumentId(String collection, String userId) async {
    try {
      return await _auth.collection(collection).get().then(
        (QuerySnapshot querySnapshot) {
          for (int i = 0; i < querySnapshot.docs.length; i++) {
            var data = querySnapshot.docs[i].data() as Map<String, dynamic>;
            if (data["userId"] == userId) {
              return querySnapshot.docs[i].id;
            }
          }
        },
      );
    } catch (e) {
      _handleError(e);
    }
    return null;
  }

  Future<void> deleteDocument(String collection) async {
    try {
      var userId = await UserSharedPreferences().getUserIdPref();

      final String documentId = await getDocumentId(collection, userId) ?? "";
      await _auth.collection(collection).doc(documentId).delete();
    } catch (e) {
      _handleError(e);
    }
  }

  // DELETE request
  Future<dynamic> delete(
    String collecion,
  ) async {
    try {
      final response = await _auth.collection(collecion);

      return response;
    } catch (e) {
      _handleError(e);
    }
  }

  // // Process HTTP response and handle errors
  // List<dynamic> _processResponse(List<dynamic> response) {
  //   List<dynamic> data = [];
  //   for (var i = 0; i < response.length; i++) {
  //     data.add(json.decode(response[0].toString()));
  //   }
  //   return data;
  // }

  // Handle non-HTTP exceptions
  void _handleError(dynamic e) {
    throw Exception(e.toString()); // 'An unexpected error occurred'
  }
}
