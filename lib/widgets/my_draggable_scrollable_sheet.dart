import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:theweather/consts/colors.dart';
import 'package:theweather/functions/functions.dart';
import 'package:theweather/consts/styles.dart';
import 'package:theweather/models/hourly_weather_model.dart';
import 'package:theweather/viewmodals/first_page_view_modal.dart';
import 'package:theweather/widgets/graph_container.dart';
import 'package:theweather/widgets/hourly_weather_container.dart';

class MyDraggableScrollableSheet extends StatelessWidget {
  final int indexOfDay;
  final Color contColor;
  final List<Data>? hourlyDatas;

  const MyDraggableScrollableSheet(
      {super.key,
      required this.contColor,
      required this.indexOfDay,
      required this.hourlyDatas});

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      maxChildSize: 1.0,
      initialChildSize: 0.8,
      minChildSize: 0.3,
      builder: (BuildContext context, ScrollController scrollController) {
        return Container(
          decoration: BoxDecoration(
              color: contColor,
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(25))),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: ListView(
              scrollDirection: Axis.vertical,
              controller: scrollController,
              children: [
                const Center(
                  child: Icon(
                    Icons.expand_more,
                    color: Colors.white,
                    size: 24,
                  ),
                ),
                const SizedBox(height: 30),
                Center(
                  child: Text(findDayOfWeek(indexOfDay)!,
                      style: MyStyles.myWhite.copyWith(fontSize: 30)),
                ),
                 const SizedBox(height: 20),
                Center(
                  child: Image.asset(
                      height: 200,
                      width: 200,
                      fit: BoxFit.cover,
                      indexOfDay == 6
                          ? 'assets/images/${context.watch<FirstPageViewModal>().currentWeatherModel?.data?[0].weather?.icon}.png'
                          : 'assets/images/${context.watch<FirstPageViewModal>().dailyWeatherModel?.data?[indexOfDay].weather?.icon}.png'),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      // 'Humudity:\n${fiveDaysModal?.list?[index].main?.humidity}%',
                      indexOfDay == 6
                          ? 'Humidity:\n${context.watch<FirstPageViewModal>().currentWeatherModel?.data?[0].rh}%'
                          : 'Humidity:\n${context.watch<FirstPageViewModal>().dailyWeatherModel?.data?[indexOfDay].rh}%',

                      style: MyStyles.myWhite.copyWith(fontSize: 18),
                    ),
                    Text(
                      indexOfDay == 6
                          ? '${context.watch<FirstPageViewModal>().currentWeatherModel?.data?[0].temp?.round()}°'
                          : '${context.watch<FirstPageViewModal>().dailyWeatherModel?.data?[indexOfDay].temp?.round()}°',
                      //'20°',
                      style: MyStyles.myWhite.copyWith(fontSize: 48),
                    ),
                    Text(
                      indexOfDay == 6
                          ? 'Wind:\n ${context.watch<FirstPageViewModal>().currentWeatherModel?.data?[0].windSpd}km/h'
                          : 'Wind:\n ${context.watch<FirstPageViewModal>().dailyWeatherModel?.data?[indexOfDay].windSpd}km/h',
                      style: MyStyles.myWhite.copyWith(fontSize: 18),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                GraphContainer(
                    hourlyDatas: hourlyDatas, indexOfDay: indexOfDay),
                SizedBox(
                  height: 15,
                ),
                HourlyWeatherContainer(
                  hourlyDatas: hourlyDatas,
                  indexOfDay: indexOfDay,
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
