import 'package:flutter/material.dart';
import 'package:furevr/model/service_model/grooming_model.dart';
import 'package:furevr/repository/services_repo/grooming_repo.dart';

class GroomingServiceViewModel extends ChangeNotifier {
  final groomingRepository = GroomingServiceRepository();

  List<GroomingServiceModel> groomingServiceModel = [];
  Future<void> getGroomingServices() async {
    try {
      var users = await groomingRepository.fetchGrooming();
      for (var i = 0; i < users.length; i++) {
        groomingServiceModel.add(GroomingServiceModel.fromJson(users[i]));
      }

      notifyListeners();
    } catch (e) {
      rethrow;
    }
  }
}
