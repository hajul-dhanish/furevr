import 'package:furevr/firebase/services.dart';

class UserRegisterRepo extends ApiService {
  Future<dynamic> addUserRigister(Map<String, dynamic> data) async {
    return await post('users', data);
  }

  Future<dynamic> updateUserRigister(Map<String, dynamic> data) async {
    return await update('users', data);
  }

  Future<dynamic> removeUserRigister(Map<String, dynamic> data) async {
    return await post('users', data);
  }
}
