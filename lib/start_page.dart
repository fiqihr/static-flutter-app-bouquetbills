import 'package:flutter/material.dart';
import 'package:project_app/register.dart';
import './login.dart';
import 'package:project_app/resources/color.dart';

class startPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondaryColor,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 30, right: 30),
          child: ListView(
            shrinkWrap: true,
            children: [
              Container(
                height: 300,
                child: Image.asset('images/logo-BouquetBills.png'),
              ),
              SizedBox(
                height: 30,
              ),
              SizedBox(
                height: 180,
              ),
              SizedBox(
                height: 48,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => registerPage(),
                      ),
                    );
                  },
                  child: Text(
                    'Daftar',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                      side: BorderSide(
                        color: primaryColor,
                        width: 1,
                      ),
                    ),
                    side: BorderSide(
                      color: primaryColor,
                      width: 1,
                    ),
                    backgroundColor: Color(0XFFBFFE6FF),
                    elevation: 5,
                    shadowColor: Colors.grey,
                  ), //<-- SEE HERE
                ),
              ),
              SizedBox(height: 10),
              SizedBox(
                height: 48,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => loginPage(),
                      ),
                    );
                  },
                  child: Text(
                    'Masuk',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: secondaryColor,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryColor,
                    elevation: 5,
                    shadowColor: Colors.grey,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
