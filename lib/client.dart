import 'dart:convert';
import 'package:http/http.dart' as http;


class Cient {
  String baseUrl = "http://localhost:8000/client/api";
  Future<List>  getAllClient() async{
    try{
       var response = await http.get(Uri.parse(baseUrl));
       if(response.statusCode == 200) {
         return jsonDecode(response.body);

       }else{
         return Future.error ('Server Error');
       }

    }
    catch(e) {
      return Future.error(e);
    }

  }
  
}