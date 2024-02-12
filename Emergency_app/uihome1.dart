import 'package:flutter/material.dart';
import 'package:my_flutter_1/project%20sub%20pages/drawer1.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(

        body: CurvedImageWithButton(),
      ),
    );
  }
}

class CurvedImageWithButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipPath(
          clipper: CurveClipper(),
          child: Image.network(
            'data:image/jpeg;base64,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'
            ,


            fit: BoxFit.cover,
            height: MediaQuery.of(context).size.height * 0.5,
            width: MediaQuery.of(context).size.width,
          ),
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'EMERGENCY \n'
                      'ASSISTANCE FOR \n'
                      'CUSTOMERS',
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Loreum ipsum dolor sit amet, consectetur\n'
                      'adipiscing elit, sed do eiusmod',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
        ),
        ElevatedButton(
          onPressed: () {
            // Navigate to another page
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => drawer1()),
            );
          },style: ElevatedButton.styleFrom(
          primary: Colors.red,
          onPrimary: Colors.white,
        ),
          child:  Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Lets get started'),
              Icon(Icons.arrow_forward),
            ],
          ),
        ),
      ],
    );
  }
}

class CurveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 50);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height - 50);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

class AnotherPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(
        child: Text('This is another page'),
      ),
    );
  }
}
