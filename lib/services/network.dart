import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper{
  final String url;

  NetworkHelper({this.url});

  Future<String> getDataPrice() async {
    try{
      http.Response response = await http.get(url);
      if (response.statusCode == 200){
        dynamic data = jsonDecode(response.body.toString());
        double price = data['last'];
        print(price);
        return price.round().toString();
      }else{
        print('Response Error from BitCoinAverage');
      }
    }catch(e){
      print(e);
    }

  }
}