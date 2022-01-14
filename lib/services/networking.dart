import 'package:http/http.dart' as http;
import 'dart:convert';

//To get data from Open Weather Map by passing URL and to check whether there is any network issue
class NetworkHelper {
  NetworkHelper(this.url);

  final String url;
  // Function to get Data from the URL (Using http package)
  Future getData() async {
    http.Response response = await http.get(url);
    /*Informational responses (100–199)
      Successful responses (200–299)
      Redirection messages (300–399)
      Client error responses (400–499)
      Server error responses (500–599) */
    if (response.statusCode == 200) {
      String data = response.body;

      return jsonDecode(
          data); //Got data in Json so using jsonDecode to decode it and to use it
    } else {
      print(response.statusCode);
    }
  }
}
