import 'dart:convert';

import 'package:http/http.dart';
import 'package:newtopbytebank/http/webclient.dart';

final packLangEn = Uri.https(
    "gist.githubusercontent.com", "Danilo13surf/"
    "14f30670060083d383dc649c623e799f/"
        "raw/"
        "3691704ca81ab96aed1d9a8a4f586b496d3176bb/"
        "i18n.json"
);
final packLangPtBr = Uri.https(
    "gist.githubusercontent.com", "Danilo13surf/"
    "84fdb2c8d8843810ff9ab592aa9d713c/"
        "raw/"
        "1f169ee6fb12be69ffecfc9dcf17cbb33f71de88/"
        "i18n_PT-BR.json"
);

class I18NWebClient {
  final String viewKey;

  I18NWebClient(this.viewKey);

  Future<Map<String, dynamic>> findAll() async {
    final Response response = await client.get(packLangEn);
    final Map<String, dynamic> decodedJson = jsonDecode(response.body);
    return decodedJson;
  }
}
