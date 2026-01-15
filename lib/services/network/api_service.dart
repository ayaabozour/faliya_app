import 'api_client.dart';
import 'dio_factory.dart';

class ApiService {
  final ApiClient client;

  ApiService(ApiClient read) : client = ApiClient(DioFactory.create());
}
