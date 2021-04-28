import 'package:http/http.dart';
import 'package:http_interceptor/http_client_with_interceptor.dart';
import 'interceptors/logging-interceptor.dart';
final baseUrl =  Uri.https('byteban-aa38b-default-rtdb.firebaseio.com','transactions.json');
// final baseUrl =  Uri.http('127.0.0.1:8080','transactions');
// final baseUrl =  Uri.http('127.0.0.1:8080','transactions');
// final baseUrl = Uri.http('10.0.2.2:8080', 'transactions');

final Client client = HttpClientWithInterceptor.build(
  interceptors: [LoggingInterceptor()],
  requestTimeout: Duration(seconds: 5),
);

// http: //192.168.1.222:8080/transactions
// final url = Uri.http('10.0.2.2:8080', 'transactions');
// final url = Uri.http('49cebca58ba4.ngrok.io:8080' ,'transactions');
// const String baseUrl = '';
// const String baseAba = 'transactions';
