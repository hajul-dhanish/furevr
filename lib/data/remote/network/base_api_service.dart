import '../../env/base_config.dart';

abstract class BaseApiService {
  final String baseUrl = Environment().config!.apiHost;

  Future<dynamic> getResponse(String url);
  Future<dynamic> postResponse(
      String url, Map<String, dynamic> requestData, 
      {bool isLoginAttempt = false, bool getHeader = false, bool isValidate = false});
}
