import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:theweather/functions/functions.dart';
import 'package:theweather/consts/styles.dart';
import 'package:theweather/models/current_weather_model.dart';
import 'package:theweather/models/daily_weather_model.dart';
import 'package:theweather/viewmodals/first_page_view_modal.dart';
import 'package:theweather/widgets/my_draggable_scrollable_sheet.dart';

class DailyWeatherWidget extends StatelessWidget {
  final Color contColor;
  final int indexOfDay;
  final DailyWeatherModel? dailyWeatherModel;
  final CurrentWeatherModel? currentWeatherModel;
  const DailyWeatherWidget(
      {super.key,
      required this.dailyWeatherModel,
      required this.indexOfDay,
      required this.contColor,
      required this.currentWeatherModel});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        //current weather ı da read etmeyi unutma!!!!
        await context.read<FirstPageViewModal>().getHourlyWeather(
            currentWeatherModel?.data?[0].lat,
            currentWeatherModel?.data?[0].lon);
 await context.read<FirstPageViewModal>().getDailyWeather(
            currentWeatherModel?.data?[0].lat,
            currentWeatherModel?.data?[0].lon);
        showModalBottomSheet(
            backgroundColor: Colors.transparent,
            isScrollControlled: true,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(top: Radius.circular(25))),
            context: context,
            builder: (context) => MyDraggableScrollableSheet(
                hourlyDatas:
                    Provider.of<FirstPageViewModal>(context, listen: false)
                        .hourlyWeatherModel
                        ?.data,
                contColor: contColor,
                indexOfDay: indexOfDay));
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
            //  border: Border.all(color: myBlack,width: 2),
            boxShadow: const [
              BoxShadow(
                color: Colors.grey,
                offset: Offset(-5.0, 0),
                blurRadius: 5.0,
                spreadRadius: 0,
              ),
              BoxShadow(
                color: Colors.grey,
                offset: Offset(5.0, 0),
                blurRadius: 5.0,
                spreadRadius: 0,
              ),
            ],
            borderRadius: BorderRadius.circular(20),
            color: contColor,
          ),
          child: Column(
            children: [
              Text(
                  style: MyStyles.myWhite.copyWith(fontSize: 20),
                  findDayOfWeek(indexOfDay)!),
              //   fiveDaysModal?.list?[index].weather?[0].icon != null ?
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Image.asset(
                    fit: BoxFit.fill,
                    width: 100,
                    height: 100,
                    dailyWeatherModel?.data?[indexOfDay].weather?.icon!=null?
                        'assets/images/${dailyWeatherModel?.data?[indexOfDay].weather?.icon}.png':'assets/images/null.png'
                    ),
              ),
             
              Text(
                  style: MyStyles.myWhite.copyWith(fontSize: 20),
                  '${dailyWeatherModel?.data?[indexOfDay].temp?.round()}°'
                  //  '${fiveDaysModal?.list?[index].main?.temp}°'
                  ),
            ],
          ),
        ),
      ),
    );
  }

}
