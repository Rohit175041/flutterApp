import 'package:rohit_17/ui/MotivationScreen.dart';
import 'package:flutter/material.dart';


import 'Question_model.dart';

class  QuizzApp extends StatefulWidget {
  const QuizzApp({Key key}) : super(key: key);


  @override
  _QuizzAppState createState() => _QuizzAppState();
}

class _QuizzAppState extends State<QuizzApp> {
  int _currentQuestionIndex = 0;
final Ques=Question.getQuestions();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration:const BoxDecoration(
              gradient: LinearGradient(
                  colors:<Color>[ Colors.black26,Colors.lightBlueAccent],
                  begin: Alignment.centerRight,
                  end: Alignment.centerLeft
              ))
          ),

        title: const Text('Test',
          style: TextStyle(fontWeight: FontWeight.w800, fontSize: 20,fontStyle: FontStyle.normal),
          ),
        centerTitle: true,
        actions: [
          IconButton(icon:const Icon(Icons.home),
              onPressed: (){Navigator.pop(context,
                MaterialPageRoute(builder: (context)=>const MotivationScreen()),);}
          ),

        ]
      ),
      body: Container(
        decoration:const BoxDecoration(
            gradient: LinearGradient(
                colors: [ Colors.black45,Colors.black12],
                begin: Alignment.centerRight,
                end: Alignment.centerLeft
            )
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
           const Padding(
              padding:  EdgeInsets.all(4),

            ),

            Padding(
              padding: const EdgeInsets.only(left: 10,right:10),
              child: SizedBox(
                height:180.0,
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 40,bottom: 10,left: 5,right: 5),
                    child: Center(
                      child: Text( Ques[_currentQuestionIndex].questionTest ,
                  style: const TextStyle(fontSize: 22,fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const HorizontalLine(),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color:Colors.white
                      ),
                      child: SizedBox(
                        height: 50,
                        child: Center(
                          child: ListTile(
                            title:Text(Ques[_currentQuestionIndex].a,
                              style:const TextStyle(color: Colors.black,fontSize: 15),),
                            onTap: ()=>_checkAnswer("a"),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color:Colors.white
                      ),
                      child: SizedBox(
                        height: 50,
                        child: Center(
                          child: ListTile(
                            title:Text(Ques[_currentQuestionIndex].b,
                              style:const TextStyle(color: Colors.black,fontSize: 15),),
                            onTap: ()=>_checkAnswer("b"),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color:Colors.white
                      ),
                      child: SizedBox(
                        height: 50,
                        child: Center(
                          child: ListTile(
                            title:Text(Ques[_currentQuestionIndex].c,
                              style:const TextStyle(color: Colors.black,fontSize: 15),),
                            onTap: ()=>_checkAnswer("c"),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color:Colors.white
                      ),
                      child: SizedBox(
                        height: 50,
                        child: Center(
                          child: ListTile(
                            title:Text(Ques[_currentQuestionIndex].d,
                              style:const TextStyle(color: Colors.black,fontSize: 15),),
                            onTap: ()=>_checkAnswer("d"),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const HorizontalLine(),
            Padding(
              padding: const EdgeInsets.only(bottom: 20,left: 15,right: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    height: 40,
                    width: 80,
                    alignment: Alignment.bottomLeft,
                    decoration:BoxDecoration(
                        borderRadius: BorderRadius.circular(28.0),
                        gradient:const LinearGradient(
                            colors: [ Colors.black45,Colors.black12],
                            begin: Alignment.centerRight,
                            end: Alignment.centerLeft
                        )),

                    child: TextButton(onPressed: ()=>_previousQuestion(),

                      child:const Icon(Icons.arrow_back,color: Colors.white,),
                    ),
                  ),
                  Container(
                    height: 40,
                    width: 80,
                    alignment: Alignment.bottomLeft,
                    decoration:BoxDecoration(
                      borderRadius: BorderRadius.circular(28.0),
                        gradient:const LinearGradient(
                            colors: [ Colors.black45,Colors.black12],
                            begin: Alignment.centerRight,
                            end: Alignment.centerLeft
                        )),
                    child: TextButton(onPressed: ()=>_nextQuestion(),
                      child:const Icon(Icons.arrow_forward,color: Colors.white,),
                    ),
                  ),
                ],
              ),
            )
            ,const Spacer()
          ],
        ),
      ),
    );
  }

  _checkAnswer(String userChoice){
    String correctAns =Ques[_currentQuestionIndex].answer;
    if(userChoice == correctAns){
      const  bar =  SnackBar(
        backgroundColor: Colors.green,
        duration:  Duration(milliseconds: 600),
        content: Center(
          heightFactor: 1,
            child: Text("Congratulation")),
      );
      ScaffoldMessenger.of(context).showSnackBar(bar);
      debugPrint("Correct");
    }else{
      final  bar = SnackBar(
        backgroundColor: Colors.red,
        duration: const Duration(milliseconds: 800),
        content: Center(
          heightFactor: 1,
            child: Text("Oops! Correct Answer : $correctAns ")),
      );
      ScaffoldMessenger.of(context).showSnackBar(bar);
      debugPrint("Incorrect");
    }
    // colorChange(){
    //   String correctAns =Ques[_currentQuestionIndex].answer;
    //   if(userChoice == correctAns){
    //     return Colors.green;
    //     duration: const Duration(milliseconds: 800);
    //   }else{
    //     return Colors.red ;
    //     duration: const Duration(milliseconds: 800);
    //   }
    //   return Colors.white;
    // }
}
  _previousQuestion(){
    setState(() {
      if(_currentQuestionIndex >= 1){
        _currentQuestionIndex--;
      }
    });
  }

_nextQuestion(){
    setState(() {
      _currentQuestionIndex=(_currentQuestionIndex + 1)%Ques.length;
    });
}
}

class HorizontalLine extends StatelessWidget{
  const HorizontalLine({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 12.0),
      child: Container(
        height: 1.5,
        color: Colors.grey,
      ),
    );
  }
}
