import 'package:flutter/material.dart';
import 'package:project_app/resources/color.dart';

class appVersion extends StatelessWidget {
  const appVersion({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: primaryColor,
        title: Text(
          'Versi Aplikasi',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: ListView(
          shrinkWrap: true,
          children: [
            Column(
              children: [
                Icon(
                  Icons.android_rounded,
                  size: 80,
                  color: primaryColor,
                ),
                Text(
                  'Versi aplikasi saat ini adalah',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                Text(
                  'V 0.0.1',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
