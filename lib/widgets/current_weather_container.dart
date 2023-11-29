import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:theweather/consts/colors.dart';
import 'package:theweather/consts/styles.dart';
import 'package:theweather/models/current_weather_model.dart';
import 'package:theweather/viewmodals/first_page_view_modal.dart';
import 'package:theweather/widgets/my_draggable_scrollable_sheet.dart';

class CurrentWeatherContainer extends StatelessWidget {
  final CurrentWeatherModel? currentWeathermodel;
  const CurrentWeatherContainer(
      {super.key, required this.currentWeathermodel});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.5,
      width: MediaQuery.of(context).size.width * 1.0,
      decoration: const BoxDecoration(
        color: Colors.purple,
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(25), bottomRight: Radius.circular(25)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            offset: Offset(0, 5),
            blurRadius: 5.0,
            spreadRadius: 0,
          ),
        ],
      ),
      child: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                  style: MyStyles.myWhite.copyWith(fontSize: 24),
                  '${currentWeathermodel?.data?[0].cityName}  '),
              Text(
                  style: MyStyles.myWhite.copyWith(fontSize: 24),
                  '${currentWeathermodel?.data?[0].countryCode}'),
            ],
          ),
          Text(
            '${currentWeathermodel?.data?[0].temp?.round()}°',
            style: MyStyles.myWhite.copyWith(fontSize: 56),
          ),
          Text(
            '${currentWeathermodel?.data?[0].weather?.description}',
            style: MyStyles.myWhite.copyWith(fontSize: 24),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  Text(
                      style: MyStyles.myWhite.copyWith(fontSize: 18),
                      'Humidity: ${currentWeathermodel?.data?[0].rh}%'
                      // 'Humidity: ${weathermodel?.main?.humidity}%'
                      ),
                  Text(
                      style: MyStyles.myWhite.copyWith(fontSize: 18),
                      'wind: ${currentWeathermodel?.data?[0].windSpd} km/h'),
                  const SizedBox(
                    height: 20,
                  ),
                  InkWell(
                      onTap: () async {
                        await context
                            .read<FirstPageViewModal>()
                            .getHourlyWeather(currentWeathermodel?.data?[0].lat,
                                currentWeathermodel?.data?[0].lon);
                                ///daily i kullanmana gerek olmayabilir.
                             await context
                            .read<FirstPageViewModal>()
                            .getCurrentWeather(currentWeathermodel?.data?[0].lat,
                                currentWeathermodel?.data?[0].lon);
                        showModalBottomSheet(
                            backgroundColor: Colors.transparent,
                            isScrollControlled: true,
                            shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(25))),
                            context: context,
                            builder: (context) => MyDraggableScrollableSheet(
                                  contColor: contColors[6],
                                  indexOfDay: 6,
                                  hourlyDatas: Provider.of<FirstPageViewModal>(
                                          context,
                                          listen: false)
                                      .hourlyWeatherModel
                                      ?.data,
                                ));
                      },
                      child: Text(
                        'click for details..',
                        style: MyStyles.myWhite.copyWith(fontSize: 16),
                      ))
                ],
              ),
              Image.asset(
                  fit: BoxFit.cover,
                  width: 150,
                  height: 150,
                  currentWeathermodel?.data?[0].weather?.icon!=null?
                  'assets/images/${currentWeathermodel?.data?[0].weather?.icon}.png': 'assets/images/null.png')
            ],
          ),
        ]),
      ),
    );
  }
}
