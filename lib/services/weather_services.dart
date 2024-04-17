import 'dart:developer'; // بتاعات log
import 'package:dio/dio.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherService {
  final Dio dio;
//
//
//
  final String baseUrl = 'https://api.weatherapi.com/v1';
  final String apiKey = '660cc1d67f5344ac8b8193542232609';
//

//https://weather.visualcrossing.com/VisualCrossingWebServices/rest/services/timeline/cairo/?key=AMUPGL2JZBHG3KERLNCP79ZH3&days=1
//
  WeatherService(this.dio);
  Future<WeatherModel> getCurrentWeather({required String cityName}) async {
    try {
      Response response = await dio
          .get('$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=1');
      WeatherModel weatherModel = WeatherModel.fromJson(response.data);
      return weatherModel;

      // Dio => API
    } on DioException catch (e) {
      final String erroMessege = e.response?.data['error']['message'] ??
          'OOPS Ther Was An Error , Try Latter';
      throw Exception(erroMessege);
    } catch (e) {
      log(e.toString());
      throw Exception('OOPS , Try Latter');
    }
  }
}
      // Dio => API
      // if => HTTP
            // if (response.statusCode == 200) {
      //   WeatherModel weatherData = WeatherModel.fromJson(response.data);
      // } else {}