import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:theweather/utlity/consts/colors.dart';
import 'package:theweather/utlity/consts/styles.dart';
import 'package:theweather/utlity/extensions/size_extensions.dart';
import 'package:theweather/viewmodals/second_page_view_modal.dart';
import 'package:theweather/viewmodals/third_page_view_modal.dart';
import 'package:theweather/views/third_page_view.dart';

class SelectedLocationContainer extends StatelessWidget {
  final int index;
  const SelectedLocationContainer({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.dynamicHeight(0.2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.purple,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.location_on,
                    color: myWhite,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Text(
                      context
                                  .watch<SecondPageViewModal>()
                                  .weatherModelList
                                  .length >
                              0
                          ? '${context.watch<SecondPageViewModal>().weatherModelList[index].data![0].cityName}'
                          : 'a',
                      style: MyStyles.myWhite.copyWith(fontSize: 24),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 10,
                  ),
                  Image.asset(
                      height: 100,
                      context
                                      .watch<SecondPageViewModal>()
                                      .weatherModelList
                                      .length >
                                  0 &&
                              context
                                      .watch<SecondPageViewModal>()
                                      .weatherModelList[index]
                                      .data?[0]
                                      .weather
                                      ?.icon !=
                                  null
                          ? 'assets/images/${context.watch<SecondPageViewModal>().weatherModelList[index].data?[0].weather?.icon}.png'
                          : 'assets/images/null.png'),
                ],
              )
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                context.watch<SecondPageViewModal>().weatherModelList.length > 0
                    ? '${context.watch<SecondPageViewModal>().weatherModelList[index].data?[0].temp?.round()}°'
                    : 'a',
                style: MyStyles.myWhite.copyWith(fontSize: 36),
              ),
              Text(
                context.watch<SecondPageViewModal>().weatherModelList.length > 0
                    ? '${context.watch<SecondPageViewModal>().weatherModelList[index].data?[0].weather?.description}'
                    : 'b',
                style: MyStyles.myWhite.copyWith(fontSize: 24),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: InkWell(
                  onTap: () async {
                    await context.read<ThirdPageViewModal>().getCurrentWeather(
                          (Provider.of<SecondPageViewModal>(context,
                                  listen: false)
                              .weatherModelList[index]
                              .data?[0]
                              .lat)!,
                          (Provider.of<SecondPageViewModal>(context,
                                  listen: false)
                              .weatherModelList[index]
                              .data?[0]
                              .lon)!,
                        );
                    await context.read<ThirdPageViewModal>().getDailyWeather(
                          (Provider.of<SecondPageViewModal>(context,
                                  listen: false)
                              .weatherModelList[index]
                              .data?[0]
                              .lat)!,
                          (Provider.of<SecondPageViewModal>(context,
                                  listen: false)
                              .weatherModelList[index]
                              .data?[0]
                              .lon)!,
                        );
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ThirdPageView(
                                  currentWeatherModel: context
                                      .watch<ThirdPageViewModal>()
                                      .currentWeatherModel,
                                  dailyWeatherModel: context
                                      .watch<ThirdPageViewModal>()
                                      .dailyWeatherModel,
                                  /*    fiveDaysModal:context.watch<ThirdPageViewModal>().fiveDaysViewModal,
                                  currentWeatherModel: context
                                      .watch<SecondPageViewModal>()
                                      .weatherModelList[index],*/
                                )));
                  },
                  child: Text(
                    'click for details..',
                    style: MyStyles.myWhite.copyWith(fontSize: 16),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
