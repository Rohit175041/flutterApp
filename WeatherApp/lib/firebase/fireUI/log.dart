import 'package:flutter/material.dart';
import 'add_student_page.dart';
import 'list_student_page.dart';



class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Flutter Firebase'),
            ElevatedButton(
              onPressed: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const AddStudentPage(),
                  ),
                )
              },
              style: ElevatedButton.styleFrom(primary: Colors.deepPurple),
              child: const Text('Add', style: TextStyle(fontSize: 20.0)),
            )
          ],
        ),
      ),
      body: const ListStudentPage(),
    );
  }
}
