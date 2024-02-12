import 'dart:async';
import 'dart:js';
import 'package:flutter/material.dart';
import 'package:my_flutter_1/Assignments/Emergency_app/page2.dart';

import '../../project sub pages/drawer1.dart';

void main() {
  runApp(MaterialApp(
    home: home12(),
      routes: {
        '/folder': (context) => listile1(),
        '/star': (context) => listile1(),
        '/file': (context) => listile1(),
        '/contacts': (context) => listile1(),
      },
  ));
}

class home12 extends StatefulWidget {
  @override
  State<home12> createState() => _home12State();
}

class _home12State extends State<home12> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TimerScreen(),
    );
  }
}
class TimerScreen extends StatefulWidget {
  @override
  _TimerScreenState createState() => _TimerScreenState();
}

class _TimerScreenState extends State<TimerScreen> {
  int _seconds = 0;
  Timer? _timer;
  int _selectedIndex = 0;

 // // Function to handle bottom navigation bar item selection
 //  void _onItemTapped(int index) {
 //    setState(() {
 //      _selectedIndex = index;
 //    });
 //  }

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        _seconds++;
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("WE'RE SENDING\n"
            "EMERGENCY SUPPORT",
          style: TextStyle(
           // color: Colors.grey,
            fontSize: 26.0,
           fontWeight: FontWeight.bold,
          ),
        )),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              "Don't worry our support team will \n"
                  "contact you in next..",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 18.0,
               // fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Stack(
                  alignment: Alignment.center,
                  children: [
                    SizedBox(
                      width: 150.0,
                      height: 150.0,
                      child: CircularProgressIndicator(
                        value: _seconds / 60.0,
                        strokeWidth: 10.0,
                        backgroundColor: Colors.grey[200],
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
                      ),
                    ),
                    Column(
                      children: [
                        Text(
                          '00:$_seconds ' ,
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Seconds ' ,
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 24.0,
                            //fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 20.0),
                ListTile(
                  title: Text('Emergency Contact',style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),),
                  subtitle: Text('408-747-7238'),
                  trailing: Icon(
                    Icons.wifi_calling_3_outlined,color: Colors.green,),
                ),
                ListTile(
                  title: Text('Emergency Contact',style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),),
                  subtitle: Text('408-747-7238'),
                  trailing: Icon(
                    Icons.wifi_calling_3_outlined,color: Colors.green,),
                ),
                ListTile(
                  title: Text('Emergency Contact',style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),),
                  subtitle: Text('408-747-7238'),
                  trailing: Icon(
                    Icons.wifi_calling_3_outlined,color: Colors.green,),
                ),
                ListTile(
                  title: Text('Emergency Contact',style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),),
                  subtitle: Text('408-747-7238'),
                  trailing: Icon(
                    Icons.wifi_calling_3_outlined,color: Colors.green,),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Colors.black,),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.folder_open, color: Colors.black),
            label: 'Folder',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star,color: Colors.black),
            label: 'Star',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.file_copy_rounded, color: Colors.black),
            label: 'File',
          ),


        ],
        // currentIndex: _selectedIndex,
        // selectedItemColor: Colors.red,
        // onTap: _onItemTapped,
      ),
    );
  }}





//
// void _onItemTapped(int index) {
//   setState(() {
//     _selectedIndex = index;
//     switch (_selectedIndex) {
//       case 0:
//         Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => drawer1()));
//         break;
//       case 1:
//         Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => FolderScreen()));
//         break;
//       case 2:
//         Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => StarScreen()));
//         break;
//       case 3:
//         Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => FileScreen()));
//         break;
//       case 4:
//         Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ContactsScreen()));
//         break;
//     }
//   });
// }}




