import 'package:flutter/material.dart';
import 'package:theweather/models/current_weather_model.dart';
import 'package:theweather/models/daily_weather_model.dart';
import 'package:theweather/views/first_page_view.dart';
import 'package:theweather/views/second_page_view.dart';

class UiTemplate extends StatefulWidget {
  final DailyWeatherModel? dailyWeatherModel;
  final CurrentWeatherModel? currentWeatherModel;

  const UiTemplate(
      {super.key,
      required this.currentWeatherModel,
      required this.dailyWeatherModel});

  @override
  State<UiTemplate> createState() => _UiTemplateState();
}

class _UiTemplateState extends State<UiTemplate> {
  int pageindex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 36,
        currentIndex: pageindex,
        onTap: (value) {
          setState(() {
            pageindex = value;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.location_on), label: 'My Location',
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.add_location_alt), label: 'Choose a Location'),
        ],
      ),
      body: IndexedStack(index: pageindex, children: [
        FirstPageView(
            currentWeatherModel: widget.currentWeatherModel,
            dailyWeatherModel: widget.dailyWeatherModel),
        const SecondPageView()
      ]),
    );
  }
}
