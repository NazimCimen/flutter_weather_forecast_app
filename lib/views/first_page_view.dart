import 'package:flutter/material.dart';
import 'package:theweather/consts/colors.dart';
import 'package:theweather/consts/styles.dart';
import 'package:theweather/models/current_weather_model.dart';
import 'package:theweather/models/daily_weather_model.dart';
import 'package:theweather/widgets/daily_weather_container.dart';
import 'package:theweather/widgets/current_weather_container.dart';

class FirstPageView extends StatelessWidget {
  final DailyWeatherModel? dailyWeatherModel;
  final CurrentWeatherModel? currentWeatherModel;
  const FirstPageView(
      {super.key,
      required this.currentWeatherModel,
      required this.dailyWeatherModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Center(
        child: CurrentWeatherContainer(
          currentWeathermodel: currentWeatherModel,
        ),
      ),
      SizedBox(
        height: MediaQuery.of(context).size.height * 0.03,
      ),
      SizedBox(
          height: MediaQuery.of(context).size.height * 0.05,
          child: Row(
            children: [
              Text(' Next 6 Days/Hourly  ',
                  style: MyStyles.myBlack.copyWith(fontSize: 24)),
              const Icon(
                Icons.touch_app,
                size: 30,
              )
            ],
          )),
      SizedBox(
        height: MediaQuery.of(context).size.height * 0.02,
      ),
      SizedBox(
        height: MediaQuery.of(context).size.height * 0.25,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 6,
            itemBuilder: (context, index) => DailyWeatherWidget(
                  dailyWeatherModel: dailyWeatherModel,
                  indexOfDay: index,
                  contColor: contColors[index],
                  currentWeatherModel: currentWeatherModel,
                )),
      ),
    ]));
  }
}
