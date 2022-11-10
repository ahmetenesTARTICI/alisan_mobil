 import 'dart:convert';

import '../models/userData.dart';
import 'package:http/http.dart' as http;
class userDataApi{
  final String url="https://reqres.in/api/users?page=2";
  Future <userData?> fetchUserData() async{

    var res=await http.get(Uri.parse(url));

    if(res.statusCode==200){
      var jsonBody=userData.fromJson(jsonDecode(res.body));
      return jsonBody;
    }
    else{
      print("istek başarısız oldu=>${res.statusCode}");
    }
  }
 }