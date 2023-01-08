import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../Util/convert_icon.dart';
import '../Util/forecost_util.dart';
import '../model/weather_model.dart';

Widget forecastCard(AsyncSnapshot<WeatherForecastModel> snapshot, int index) {
  var forecastList = snapshot.data.list;
  var dayOfWeek = "";
  DateTime date =
   DateTime.fromMillisecondsSinceEpoch(forecastList[index].dt * 1000);
  var fullDate = Util.getFormattedDate(date);
  dayOfWeek = fullDate.split(",")[0]; //[Saturday,Dec 14,2019]

  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(dayOfWeek),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 2.50),
            child: CircleAvatar(
              radius: 33,
              backgroundColor: Colors.lightBlue,
              // If it doesn't show (Font awesome icons are not showing)

              /*
                  Please try:

                    Stopping the app
                    Running flutter clean in your app directory
                    Deleting the app from your simulator / emulator / device
                    Rebuild & Deploy the app.

                   */
              //source: https://github.com/brianegan/font_awesome_flutter/issues/28#issuecomment-460109786
              child: getWeatherIcon(
                  weatherDescription: forecastList[index].weather[0].main,
                  color: Colors.white,
                  size: 45),
            ),
          ),
          Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0,bottom: 2.5),
                    child: Text(
                        "${forecastList[index].temp.min.toStringAsFixed(0)} °F"),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 4.0),
                    child: Icon(
                      FontAwesomeIcons.solidArrowAltCircleDown,
                      color: Colors.white,
                      size: 17,
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0,bottom: 2.5),
                child: Row(
                  children: <Widget>[
                    Text(
                        "${forecastList[index].temp.max.toStringAsFixed(0)} °F"),
                    const Padding(
                      padding: EdgeInsets.only(left: 4.0),
                      child: Icon(
                        FontAwesomeIcons.solidArrowAltCircleUp,
                        color: Colors.white,
                        size: 17,
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0,bottom: 2.5),
                child: Row(
                  children: <Widget>[
                    Text(
                        "Hum:${forecastList[index].humidity.toStringAsFixed(0)} %"),
//                     Icon(FontAwesomeIcons.solidGrinBeamSweat, color: Colors.white,
//                       size: 17,)
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0,bottom: 2.5),
                child: Row(
                  children: <Widget>[
                    Text(
                        "Win:${forecastList[index].speed.toStringAsFixed(1)} mi/h"),
//                     Icon(FontAwesomeIcons.wind, color: Colors.white,
//                       size: 17,)
                  ],
                ),
              )
            ],
          )
        ],
      ),
    ],
  );
}