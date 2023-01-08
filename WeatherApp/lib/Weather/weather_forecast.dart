import 'package:flutter/material.dart';
import 'package:slide_digital_clock/slide_digital_clock.dart';
import '../ui/MyDrawer1.dart';
import 'UI/bottom_views.dart';
import 'UI/mid_view.dart';
import 'model/weather_model.dart';
import 'networkBox/network.dart';

class WeatherForecast extends StatefulWidget {
  const WeatherForecast({Key key}) : super(key: key);

  @override
  _WeatherForecastState createState() => _WeatherForecastState();
}

class _WeatherForecastState extends State<WeatherForecast> {
  Future<WeatherForecastModel> forecastObject;
  String _cityName = "Gorakhpur";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    forecastObject = getWeather(cityName: _cityName);

//    forecastObject.then((weather) {
//        print(weather.list[0].weather[0].main);
//    });
  }

  @override
  Widget build(BuildContext context) {
    String urlImage="https://getwallpapers.com/wallpaper/full/f/e/9/330789.jpg";
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
            decoration:const BoxDecoration(
               // borderRadius: BorderRadius.only(bottomRight:Radius.circular(250)),
                gradient: LinearGradient(
                    colors:<Color>[ Colors.black26,Colors.lightBlueAccent],
                    begin: Alignment.centerRight,
                    end: Alignment.centerLeft
                ))),
        title:const Center(
          child: Text('Weather',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30,fontStyle: FontStyle.normal),
          ),

        ),

      ),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(image: NetworkImage(urlImage),
                fit: BoxFit.cover)
        ),
        child: ListView(
          children: <Widget>[
           textFieldView(),
            FutureBuilder<WeatherForecastModel>(
                future: forecastObject,
                builder: (BuildContext context,
                    AsyncSnapshot<WeatherForecastModel> snapshot) {
                  if (snapshot.hasData) {
                    return Column(
                      children: <Widget>[
                        clock(),
                        MidView(snapshot: snapshot),
                        //midView(snapshot),
                        BottomView(snapshot: snapshot)
                        //bottomView(snapshot, context)
                      ],
                    );
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                })
          ],
        ),
      ),
      drawer: const Mydrawer(),
    );
  }

  Widget textFieldView() {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: TextField(
      decoration: InputDecoration(
        focusColor: Colors.white,
          hintText: "Enter City Name",
          hintStyle:const TextStyle(color: Colors.white),
          prefixIcon:const Icon(Icons.search,color: Colors.white,),
          border:
          OutlineInputBorder(borderRadius: BorderRadius.circular(10)
          ),
          contentPadding:const EdgeInsets.all(8)),
      onSubmitted: (value) {
        setState(() {
          _cityName = value;
          forecastObject = getWeather(cityName: _cityName,);
        });
        setState(() {
          if(_cityName.isEmpty){
            _cityName = "Gorakhpur";
            forecastObject = getWeather(cityName: _cityName,);
          }
        });
      },
        ),
    );
  }

  Future<WeatherForecastModel> getWeather({String cityName}) =>
       Network().getWeatherForecast(cityName: _cityName);

  clock() {
    return DigitalClock(
      digitAnimationStyle: Curves.easeInOut,
      is24HourTimeFormat: false,
      areaDecoration:const BoxDecoration(
          color: Colors.transparent
      ),
    );
  }

}

