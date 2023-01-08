import 'package:flutter/material.dart';
import 'package:rohit_17/ui/Motivation.dart';
import 'package:flutter_tts/flutter_tts.dart';

import '../Weather/weather_forecast.dart';


class MotivationScreen extends StatefulWidget{
   const MotivationScreen({Key key}) : super(key: key);

  @override
  _MotivationScreenState createState()=>_MotivationScreenState();
}

class _MotivationScreenState extends State<MotivationScreen> {
  int _index =0;
  final FlutterTts flutterTts = FlutterTts();
  final TextEditingController textEditingController = TextEditingController();

  speak(String text1) async{
    await flutterTts.setLanguage("en-UK");
    await flutterTts.setPitch(1.18);
    await flutterTts.speak(text1);
  }


 final List<Quets>motivationLines=Quets.getQuets();
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
            decoration:const BoxDecoration(
                borderRadius: BorderRadius.only(bottomRight:Radius.circular(0)),
                gradient: LinearGradient(
                    colors:<Color>[ Colors.black26,Colors.lightBlueAccent],
                    begin: Alignment.centerRight,
                    end: Alignment.centerLeft
                ))),
        title:const Center(
            child: Text('Movitation',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30,fontStyle: FontStyle.normal),
            ),

        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: IconButton(icon: const Icon(Icons.home,), onPressed: (){Navigator.push(context,
              MaterialPageRoute(builder: (context)=> const WeatherForecast()),);}),
          ),

        ],
      ),

      // backgroundColor:Colors.green,
      body: Container(
        decoration:const BoxDecoration(
            borderRadius: BorderRadius.only(topLeft:Radius.circular(0)),
          gradient: LinearGradient(
            // colors: [Colors.black12,Colors.black45],
              colors: [Colors.black12,Colors.black45],
            end: Alignment.topCenter,
            begin: Alignment.bottomCenter
          )
        ),
        //color:Colors.black26,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 85),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                    // color: Colors.blueGrey.shade900,
                    style: BorderStyle.solid
                ),
                borderRadius: BorderRadius.circular(0),
                color: Colors.transparent,
              ),
              child: ListView(
                scrollDirection: Axis.vertical,
                padding:const EdgeInsets.only(left: 12,right: 12,top: 20.5,bottom: 10),
                children:<Widget>[
                  Flexible(
                    child: Center(
                      child: Text(motivationLines[_index%motivationLines.length].statement,
                        style:const TextStyle(fontSize:25,fontStyle: FontStyle.italic,color: Colors.white
                      ),),

                  )),
                  Flexible(
                     child: Text(motivationLines[_index%motivationLines.length].person,
                       style:const TextStyle(fontSize:32,fontStyle: FontStyle.italic,color: Colors.white,fontWeight: FontWeight.bold
                  ),textDirection: TextDirection.rtl,),
                  ),
                ]
              ),
            ),
          ),
        ),
      ),
      floatingActionButton:Padding(
        padding: const EdgeInsets.only(left:32.0,bottom: 5),

        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children:[
            Container(
              height: 45,
              width: 80,
              decoration:BoxDecoration(
                  borderRadius: BorderRadius.circular(28.0),
                  gradient:const LinearGradient(
                      colors: [Colors.black12,Colors.black45],
                      begin: Alignment.centerRight,
                      end: Alignment.centerLeft
                  )),
              child: Center(
                child: TextButton(onPressed: ()=>_showQuiete(),
                  child:const Icon(Icons.skip_previous,color: Colors.white),
                ),
              ),
            ),
            Container(
              height: 45,
              width: 80,
              decoration:BoxDecoration(
                  borderRadius: BorderRadius.circular(28.0),
                  gradient:const LinearGradient(
                      colors: [Colors.black12,Colors.black45],
                      begin: Alignment.centerRight,
                      end: Alignment.centerLeft
                  )),
              child: Center(
                child: TextButton(
                   onPressed: (){
                     speak(motivationLines[_index%motivationLines.length].statement );
                   },
                    child:const Icon(Icons.mic,color: Colors.white)
                ),
              ),
            ),

            Container(
              height: 45,
              width: 80,
              decoration:BoxDecoration(
                  borderRadius: BorderRadius.circular(28.0),
                  gradient:const LinearGradient(
                      colors: [Colors.black12,Colors.black45],
                      begin: Alignment.centerRight,
                      end: Alignment.centerLeft
                  )),
              child: Center(
                child: TextButton(onPressed: ()=>_back(),
                    child:const Icon(Icons.skip_next,color: Colors.white)
                ),
              ),
            ),
          ]
        ),
      ),
      // drawer: const Mydrawer(),
    );
  }
  void _showQuiete() {
    setState(() {
      _index+=1;
    });

  }

  void _back() {
    setState(() {
      _index-=1;
    });

  }
}


class HorizontalLine extends StatelessWidget{
  const HorizontalLine({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0.0,vertical: 12.0),
      child: Container(
        height: 1.5,
        color: Colors.grey,
      ),
    );
  }
}


//flutter build appbundle --target-platform android-arm,android-arm64
//flutter pub get
//flutter pub run flutter_launcher_icons:main