import 'dart:io';
import 'package:http/http.dart' as http;

class ApiService {
  static Future getWeatherDataByCity(String city) async {
    return await http.get(
        Uri.parse(
            "https://api.collectapi.com/weather/getWeather?data.lang=tr&data.city=$city"),
        headers: {
          HttpHeaders.authorizationHeader:
              'apikey 32j9cWNjp8LvgdHuJHCqEA:26Q3GYJNV8MH0S0BKU2yT8',
          HttpHeaders.contentTypeHeader: 'application/json'
        });
  }
}
