import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/main.dart';
import 'package:weather_app/models/weather_model.dart';
// import 'package:weather_app/models/weather_model.dart';

class WeatherInfoBody extends StatelessWidget {
  const WeatherInfoBody({Key? key, required this.weather}) : super(key: key);

  final WeatherModel weather;
  @override
  Widget build(BuildContext context) {
    WeatherModel weatherModel =
        BlocProvider.of<GetWeatherCubit>(context).weatherModel!;
    weatherModel.image!.contains("https");

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
          // Colors.orange,
          // Colors.pink,
          getThemeColor(weatherModel.weatherCondition),
          getThemeColor(weatherModel.weatherCondition)[300]!,
          getThemeColor(weatherModel.weatherCondition)[50]!
        ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              weatherModel.cityName,
              style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            Text(
              'updated at ${weatherModel.date.hour}:${weatherModel.date.minute}',
              style: const TextStyle(fontSize: 24, color: Colors.black),
            ),
            const SizedBox(
              height: 32,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.network(
                  // "https:${weatherModel.image}",
                  weatherModel.image!,
                ),
                Text(
                  weatherModel.temp.toString(),
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 32,
                      color: Colors.black),
                ),
                Column(
                  children: [
                    Text(
                      'Maxtemp:${weatherModel.maxTemp.round()}',
                      style: const TextStyle(fontSize: 16, color: Colors.black),
                    ),
                  ],
                ),
                Text(
                  'Mintemp: ${weatherModel.minTemp.round()}',
                  style: const TextStyle(fontSize: 16, color: Colors.black),
                ),
              ],
            ),
            const SizedBox(
              height: 32,
            ),
            Text(
              weatherModel.weatherCondition,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 32,
              ),
            ),
          ],
        ),
      ),
    );
  }
}





// class CustomText extends StatelessWidget {
//   const CustomText({
//     super.key,
//     required this.weatherModel,
//   });

//   final WeatherModel weatherModel;
//   @override
//   Widget build(BuildContext context) {
//     return Text(
//       BlocProvider.of<GetWeatherCubit>(context).weatherModel.cityName,
//       style: const TextStyle(
//           fontWeight: FontWeight.bold, fontSize: 32, color: Colors.black),
//     );
//   }
// }

// class CustomTextWidget extends StatelessWidget {
//   const CustomTextWidget({
//     super.key,
//   });
//   @override
//   Widget build(BuildContext context) {
//     return const Text(
//       '17',
//       style: TextStyle(
//           fontWeight: FontWeight.bold, fontSize: 32, color: Colors.black),
//     );
//   }
// }

// class CustomWeatherCondetionText extends StatelessWidget {
//   const CustomWeatherCondetionText({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return const Text(
//       'Ligh Rain',
//       style: TextStyle(
//           fontWeight: FontWeight.bold, fontSize: 32, color: Colors.black),
//     );
//   }
// }
