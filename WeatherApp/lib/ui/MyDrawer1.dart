import 'package:rohit_17/ui/BillSplitter.dart';
import 'package:rohit_17/ui/Movie.dart';
import 'package:rohit_17/ui/Quizz_page.dart';
import 'package:flutter/material.dart';
import '../firebase/fireUI/log.dart';
import '../flutter_maps/simple_google_map/show_map.dart';
import 'MotivationScreen.dart';


class Mydrawer extends StatelessWidget{
  const Mydrawer({Key key}) : super(key: key);


  @override
  Widget build(BuildContext context){
    const imageUrl="https://www.pixelstalk.net/wp-content/uploads/2016/06/HD-images-of-nature-download.jpg";
    return Drawer(
      child: Container(
        decoration:const BoxDecoration(
            gradient: LinearGradient(
                colors:<Color>[ Colors.black26,Colors.lightBlueAccent],
                begin: Alignment.centerRight,
                end: Alignment.centerLeft
            )
      ),
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
           Column(
             children:const [
               UserAccountsDrawerHeader(
                    decoration:BoxDecoration(
                      borderRadius: BorderRadius.only(bottomRight:Radius.circular(120),topRight: Radius.circular(0)),
                        gradient: LinearGradient(
                            colors:<Color>[ Colors.black26,Colors.lightBlueAccent],
                            begin: Alignment.centerRight,
                            end: Alignment.centerLeft
                        )
                    ),
                    accountName: Text("Rohit Kumar Singh",style: TextStyle(fontWeight: FontWeight.bold),),
                    accountEmail: Text("Rohit175041@gamil.com"),
                    currentAccountPicture: CircleAvatar(
                      backgroundImage: NetworkImage(imageUrl),
                    ),
                  ),
             ],
           ),
            Padding(
              padding: const EdgeInsets.all(6.0),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color:Colors.black26
                ),
                child: SizedBox(
                  height: 55,
                  child: Center(
                    child: ListTile(
                      leading:const Icon(Icons.request_page,color: Colors.white),
                      title:const Text("Billmaker",style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 15
                        ),
                      ),
                      //subtitle: Text(" "),
                      trailing:const Icon(Icons.more_vert,color: Colors.white),
                      onTap: () {Navigator.push(context,
                         MaterialPageRoute(builder: (context)=>const BillSplitter()),);},
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(6.0),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color:Colors.black26
                ),
                child: SizedBox(
                  height: 55,
                  child: Center(
                    child: ListTile(
                      leading:const Icon(Icons.tv_rounded,color: Colors.white),
                      title:const Text("Movies",style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 15
                      ),
                      ),
                      //subtitle: Text(" "),
                      trailing:const Icon(Icons.more_vert,color: Colors.white),
                      onTap: () {Navigator.push(context,
                        MaterialPageRoute(builder: (context)=>const MovieListView()),);},
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(6.0),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color:Colors.black26
                ),
                child: SizedBox(
                  height: 55,
                  child: Center(
                    child: ListTile(
                      leading:const Icon(Icons.contact_page_sharp,color: Colors.white),
                      title:const Text("Test",style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 15
                      ),
                      ),
                      //subtitle: Text(" "),
                      trailing:const Icon(Icons.more_vert,color: Colors.white),
                      onTap: () {Navigator.push(context,
                        MaterialPageRoute(builder: (context)=>const QuizzApp()),);},
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(6.0),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color:Colors.black26
                ),
                child: SizedBox(
                  height: 55,
                  child: Center(
                    child: ListTile(
                      leading:const Icon(Icons.cloud_circle,color: Colors.white),
                      title:const Text("Motivation",style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 15
                      ),
                      ),
                      //subtitle: Text(" "),
                      trailing:const Icon(Icons.more_vert,color: Colors.white),
                      onTap: () {Navigator.push(context,
                        MaterialPageRoute(builder: (context)=>const MotivationScreen()),);},
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(6.0),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color:Colors.black26
                ),
                child: SizedBox(
                  height: 55,
                  child: Center(
                    child: ListTile(
                      leading:const Icon(Icons.map_outlined,color: Colors.white),
                      title:const Text("Map",style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 15
                      ),
                      ),
                      //subtitle: Text(" "),
                      trailing:const Icon(Icons.more_vert,color: Colors.white),
                      onTap: () {Navigator.push(context,
                        MaterialPageRoute(builder: (context)=>const ShowSimpleMap()),);},
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(6.0),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color:Colors.black26
                ),
                child: SizedBox(
                  height: 55,
                  child: Center(
                    child: ListTile(
                      leading:const Icon(Icons.login_outlined,color: Colors.white),
                      title:const Text("Login",style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 15
                      ),
                      ),
                      //subtitle: Text(" "),
                      trailing:const Icon(Icons.more_vert,color: Colors.white),
                      onTap: () {Navigator.push(context,
                        MaterialPageRoute(builder: (context)=>const HomePage()),);},
                    ),
                  ),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}