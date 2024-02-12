import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ContactListScreen(),
    );
  }
}

class ContactListScreen extends StatelessWidget {
  final List<Map<String, dynamic>> contacts = [
    {
      'name': 'John Doe',
      'contactNumber': '1234567890',
      'profilePicture': 'assets/john_doe_profile.jpg',
    },
    {
      'name': 'Jane Smith',
      'contactNumber': '1234567891',
      'profilePicture': 'assets/jane_smith_profile.jpg',
    },
    // Add more contacts as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80.0), // Adjust the height as needed
        child: AppBar(
          backgroundColor: Colors.blue, // Background color of the app bar
          elevation: 0, // Remove the default app bar elevation
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20.0),
              bottomRight: Radius.circular(20.0),
            ),
          ),
          title: Text(
            'Emergency Contact List',
            style: TextStyle(color: Colors.white),
          ),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              // Add functionality to navigate back
            },
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                // Add functionality to add new contact
              },
            ),
          ],
        ),
      ),
      body: ListView.builder(
        itemCount: contacts.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage(contacts[index]['profilePicture']),
            ),
            title: Text(contacts[index]['name']),
            subtitle: Text(contacts[index]['contactNumber']),
            onTap: () async {
              String contactNumber = 'tel:${contacts[index]['contactNumber']}';
              if (await canLaunch(contactNumber)) {
                await launch(contactNumber);
              } else {
                throw 'Could not launch $contactNumber';
              }
            },
          );
        },
      ),
    );
  }
}
