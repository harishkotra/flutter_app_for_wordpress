import 'package:http/http.dart' as http;
import 'dart:convert';

Future<List> fetchWpPosts() async {
  final response = await http.get('https://fests.info/wp-json/wp/v2/posts', headers: {"Accept": "application/json"});
  var convertDataToJSON = jsonDecode(response.body);
  return convertDataToJSON;
}