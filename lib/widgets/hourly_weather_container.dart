import 'package:flutter/material.dart';
import 'package:theweather/utlity/functions/functions.dart';
import 'package:theweather/utlity/consts/styles.dart';
import 'package:theweather/models/hourly_weather_model.dart';

class HourlyWeatherContainer extends StatelessWidget {
  final int indexOfDay;
  final List<Data>? hourlyDatas;
  const HourlyWeatherContainer(
      {super.key, required this.hourlyDatas, required this.indexOfDay});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height*0.18,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(25),
        color: Colors.white,
      ),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 24,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                  style: MyStyles.myBlack,
                  '${getHour(getHourlyList(hourlyDatas, indexOfDay)?[index].timestampLocal)}:00'),
              Image.asset(
                  height: 60,
                  width: 60,
                  fit: BoxFit.cover,
                  hourlyDatas?[index].weather?.icon!=null?
                   'assets/images/${hourlyDatas?[index].weather?.icon}.png':
                  'assets/images/null.png'),
                   
              Text(
                  style: MyStyles.myBlack.copyWith(fontSize: 16),
                  '${getHourlyList(hourlyDatas, indexOfDay)?[index].temp?.round()}°')
            ],
          ),
        ),
      ),
    );
  }
}
