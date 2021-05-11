import 'package:http/http.dart';
import 'package:http_interceptor/http_client_with_interceptor.dart';
import 'interceptors/logging-interceptor.dart';
final baseUrl =  Uri.https('AQUI O FIREBASE','transactions.json');


final Client client = HttpClientWithInterceptor.build(
  interceptors: [LoggingInterceptor()],
  requestTimeout: Duration(seconds: 5),
);
