import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(75.0),
        child: AppBar(
          backgroundColor: Colors.deepOrange,
          title: Text(
            'Accounts',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
          actions: [
            Icon(Icons.search, color: Colors.white, size: 33),
            CircleAvatar(
              backgroundColor: Colors.white,
              child: Text(
                'SC',
                style: TextStyle(color: Colors.deepOrange),
              ),
            ),
          ],
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: 60),
          Center(
            child: CustomPaint(
              size: Size(150, 150),
              painter: DashedCirclePainter(),
              child: Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: ClipOval(
                  child: Icon(
                    Icons.person,
                    size: 80,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 40),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(14.0),
                  color: Color.fromARGB(255, 218, 214, 214),
                  child: Text(
                    'Account Name',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                SizedBox(height: 25), // Space between the boxes
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(14.0),
                  color: Color.fromARGB(255, 218, 214, 214),
                  child: Text(
                    'Type',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                SizedBox(height: 25), // Space between the boxes
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(14.0),
                  color: Color.fromARGB(255, 218, 214, 214),
                  child: Text(
                    'Opening Balance',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ],
            ),
          ),
          Spacer(),
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: 14.0, horizontal: 14.0),
            color: Colors.deepOrange,
            child: Text(
              'Confirm',
              style: TextStyle(color: Colors.white, fontSize: 18),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}

class DashedCirclePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    double dashWidth = 5, dashSpace = 3;
    final paint = Paint()
      ..color = Colors.black
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    double radius = size.width / 2;
    double circumference = 2 * 3.141592653589793 * radius;
    double dashCount = circumference / (dashWidth + dashSpace);

    for (int i = 0; i < dashCount; ++i) {
      double startAngle = (i * (dashWidth + dashSpace)) / radius;
      double sweepAngle = dashWidth / radius;
      canvas.drawArc(
        Rect.fromCircle(center: Offset(radius, radius), radius: radius),
        startAngle,
        sweepAngle,
        false,
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
