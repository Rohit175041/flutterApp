import 'package:rohit_17/ui/MotivationScreen.dart';
import 'package:flutter/material.dart';


class BillSplitter extends StatefulWidget {
  const BillSplitter({Key key}) : super(key: key);

  @override
  _BillSplitterState createState()=> _BillSplitterState();
}

class _BillSplitterState extends State<BillSplitter>{
  int _tipPercentage =0;
  int _personCounter=1;
  double _billAmount=0.0;
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
                 ))),
         title:const Center(
           child: Text('Billmaker',
             style: TextStyle(fontWeight: FontWeight.w800, fontSize: 20,fontStyle: FontStyle.normal),
           ),

         ),
         actions: [
           IconButton(icon:const Icon(Icons.home),
               onPressed: (){Navigator.pop(context,
                 MaterialPageRoute(builder: (context)=>const MotivationScreen()),);}
           ),

         ],
       ),
       body: Container(

         margin: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.0),
         alignment: Alignment.center,
         decoration:const BoxDecoration(
             gradient: LinearGradient(
                 colors: [Colors.black12,Colors.black45],
                 end: Alignment.topCenter,
                 begin: Alignment.bottomCenter
             )
         ),

         child: ListView(
           scrollDirection: Axis.vertical,
           padding:const EdgeInsets.all(20.5),
           children:<Widget>[
             Container(
               width: 150,
               height: 150,
               decoration: BoxDecoration(
                   borderRadius: BorderRadius.circular(15)
               ),
               child: Center(
                 child: Column(
                   mainAxisAlignment: MainAxisAlignment.center,
                   children: <Widget>[
                    const Text("Total Per Person", style: TextStyle(
                           color: Colors.black,
                         fontWeight: FontWeight.normal,
                         fontSize: 25),),

                     Padding(
                       padding: const EdgeInsets.all(12.0),
                       child: Text("₹ ${calculateTotalPerPerson(_billAmount,_personCounter,_tipPercentage )}",
                         style:const TextStyle(
                           color: Colors.black,
                           fontWeight: FontWeight.bold,
                           fontSize: 25),),
                     )
                   ],
                 ),
               ),
             ),

             Container(
               margin:const EdgeInsets.only(top: 30.0),
               padding:const EdgeInsets.all(12.0),
               decoration: BoxDecoration(
                 border: Border.all(
                   color: Colors.blueGrey.shade900,
                   style: BorderStyle.solid
                 ),
                 borderRadius: BorderRadius.circular(15),
                 color: Colors.transparent,
               ),

               child: Column(
                 children: <Widget>[
                   TextField(
                     keyboardType:const TextInputType.numberWithOptions(decimal: true),
                     style:const TextStyle(color: Colors.black),
                     decoration:const InputDecoration(
                       prefixText: "Bill Amount ₹ : ",
                     ),
                     onChanged: (String value){
                       try{
                         _billAmount =double.parse(value);
                       }catch(exception){
                         _billAmount = 0.0;
                       }
                     },
                   ),
                   Row(
                     mainAxisAlignment:MainAxisAlignment.spaceBetween ,
                     children: <Widget>[
                         const Text("Split",style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 20
                          ),),
                       Row(
                           children: <Widget>[
                             InkWell(
                               onTap: (){
                                 setState((){
                                   if(_personCounter>1){
                                     _personCounter--;
                                   }else{
                                     //do nothing
                                   }
                                 });
                               },
                               child: Container(
                                 width: 40,
                                 height: 40,
                                 margin:const EdgeInsets.all(10.0),
                                 decoration: BoxDecoration(
                                     borderRadius: BorderRadius.circular(7.0),
                                    // color: Colors.grey.withOpacity(0.5)
                                     color: Colors.grey
                                 ),
                                 child:const Center(
                                   child: Text("-",
                                     style: TextStyle(
                                         color: Colors.black,
                                         fontWeight: FontWeight.bold,
                                         fontSize: 25.0
                                     ),
                                   ),
                                 ),
                               ),
                             ),
                             Text("$_personCounter",style:const TextStyle(
                                 color: Colors.black,
                                 fontWeight: FontWeight.bold,
                                 fontSize: 25
                             ),),

                             InkWell(
                                 onTap: (){
                                   setState(() {
                                     _personCounter++;
                                   });
                                 },
                                 child: Container(
                                   width: 40,
                                   height: 40,
                                   margin:const EdgeInsets.all(10.0),
                                   decoration: BoxDecoration(
                                       borderRadius: BorderRadius.circular(7.0),
                                       color: Colors.grey
                                   ),
                                   child:const Center(
                                     child: Text("+",
                                       style: TextStyle(
                                           color: Colors.black,
                                           fontWeight: FontWeight.bold,
                                           fontSize: 25.0
                                       ),
                                     ),
                                   ),
                                 )
                                 ),
                           ]
                       ),
                   ],
                   ),

                   //Tip
                   Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children:<Widget>[
                      const Text("Tip ",style: TextStyle(
                           color: Colors.black,
                           fontWeight: FontWeight.bold,
                           fontSize: 20
                       ),),

                       Padding(
                         padding: const EdgeInsets.all(18.0),
                         child: Text("₹ ${claculateTotalTip(_billAmount, _personCounter, _tipPercentage)}",
                           style:const TextStyle(
                             color: Colors.black,
                             fontWeight: FontWeight.bold,
                             fontSize: 25
                         ),),
                       ),
                     ],
                   ),

                   //Slider
                   Column(
                     children: <Widget>[
                       Text("$_tipPercentage%",style:const TextStyle(
                             color: Colors.black,
                             fontWeight: FontWeight.bold,
                             fontSize: 25
                       ),),

                       Slider(
                           min:0,
                           max: 100,
                          activeColor: Colors.black,
                           divisions: 10,
                           value: _tipPercentage.toDouble(),
                           onChanged: (double value){
                              setState(() {
                                _tipPercentage=value.round();
                              });
                           })
                     ],
                   )


                 ],
               ),
             ),

           ],
         ),

       ),
     );
  }

  calculateTotalPerPerson( double billAmount,int splitBy,int  tipPercentage){
    var totalPerPerson = ( claculateTotalTip(billAmount,splitBy, tipPercentage) + billAmount)/splitBy;
    return totalPerPerson.toStringAsFixed(2);
  }

  claculateTotalTip(double billAmount,int splitBy,int tipPercentage){
   double totalTip=0.0;
   if(billAmount<0||billAmount.toString().isEmpty|| billAmount == 0 ){
     //no go!
   }else{
     totalTip=(billAmount * tipPercentage)/100;
   }
   return totalTip;
  }

}
