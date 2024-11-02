import 'package:furevr/firebase/services.dart';

class GroomingServiceRepository extends ApiService {
  GroomingServiceRepository();

  Future<dynamic> fetchGrooming() async {
    return await get('grooming');
  }
}
