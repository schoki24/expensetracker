import 'package:flutter/material.dart';

class MyProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(67.0),
        child: AppBar(
          backgroundColor: Colors.deepOrange,
          title: Text(
            'My Profile',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: 60),
          Center(
            child: CircleAvatar(
              radius: 75,
              backgroundImage: NetworkImage(
                  'https://lumiere-a.akamaihd.net/v1/images/6d7454cea6644379adc7e529c5790a28078a2823.jpeg?region=0,0,450,450'),
            ),
          ),
          SizedBox(height: 40),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                Text(
                  'Sonam Choki',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10), // Space between the texts
                Text(
                  'Software Engineer',
                  style: TextStyle(color: Colors.black, fontSize: 15),
                ),
                SizedBox(height: 10), // Space between the texts
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.calendar_today,
                      size: 20,
                      color: Colors.black,
                    ),
                    SizedBox(width: 5),
                    Text(
                      '24th February, 1977',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(height: 10), // Space between the texts
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.location_on_rounded,
                      size: 20,
                      color: Colors.black,
                    ),
                    SizedBox(width: 5),
                    Text(
                      'Thimphu, Bhutan',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                SizedBox(height: 50), // Space between the texts
                Text(
                  'Total Banlance',
                  style: TextStyle(color: Colors.black, fontSize: 15),
                ),
                SizedBox(height: 10), // Space between the texts
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(width: 5),
                    Text(
                      'Nu.43000',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 26,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(height: 10), // Space between the texts
                Text(
                  'Total Expenses',
                  style: TextStyle(color: Colors.black, fontSize: 15),
                ),
                SizedBox(height: 10), // Space between the texts
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(width: 5),
                    Text(
                      'Nu.850000',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 26,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
