import 'package:flutter/material.dart';
import 'package:project_app/resources/color.dart';
import 'package:project_app/data_holder.dart';

class editProfile extends StatelessWidget {
  const editProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          'Edit Profile',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: primaryColor,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: ListView(
            shrinkWrap: true,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.person,
                    color: primaryColor,
                    size: 14,
                  ),
                  Text(
                    '  Username',
                    style: TextStyle(fontSize: 11),
                  ),
                ],
              ),
              SizedBox(
                height: 45,
                child: TextField(
                  controller: DataHolder.usernameC,
                  autocorrect: false,
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 10,
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: primaryColor,
                      ),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: primaryColor,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Icon(
                    Icons.person_outlined,
                    color: primaryColor,
                    size: 14,
                  ),
                  Text(
                    '  Nama',
                    style: TextStyle(fontSize: 11),
                  ),
                ],
              ),
              SizedBox(
                height: 45,
                child: TextField(
                  controller: DataHolder.nameC,
                  autocorrect: false,
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 10,
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: primaryColor,
                      ),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: primaryColor,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Icon(
                    Icons.email_rounded,
                    color: primaryColor,
                    size: 14,
                  ),
                  Text(
                    '  Email',
                    style: TextStyle(fontSize: 11),
                  ),
                ],
              ),
              SizedBox(
                height: 45,
                child: TextField(
                  controller: DataHolder.emailC,
                  autocorrect: false,
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 10,
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: primaryColor,
                      ),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: primaryColor,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Icon(
                    Icons.phone_rounded,
                    color: primaryColor,
                    size: 14,
                  ),
                  Text(
                    '  No. Telepon',
                    style: TextStyle(fontSize: 11),
                  ),
                ],
              ),
              SizedBox(
                height: 45,
                child: TextField(
                  controller: DataHolder.callC,
                  autocorrect: false,
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 10,
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: primaryColor,
                      ),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: primaryColor,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Icon(
                    Icons.home_rounded,
                    color: primaryColor,
                    size: 14,
                  ),
                  Text(
                    '  Alamat',
                    style: TextStyle(fontSize: 11),
                  ),
                ],
              ),
              SizedBox(
                height: 45,
                child: TextField(
                  controller: DataHolder.addressC,
                  autocorrect: false,
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.done,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 10,
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: primaryColor,
                      ),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: primaryColor,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              SizedBox(height: 20),
              SizedBox(
                height: 48,
                child: ElevatedButton(
                  onPressed: () {
                    DataHolder.storedTextUsername = DataHolder.usernameC.text;
                    DataHolder.storedTextName = DataHolder.nameC.text;
                    DataHolder.storedTextEmail = DataHolder.emailC.text;
                    DataHolder.storedTextCall = DataHolder.callC.text;
                    DataHolder.storedTextAddress = DataHolder.addressC.text;
                    print("name: ${DataHolder.nameC.text}");
                    print("username: ${DataHolder.usernameC.text}");
                    print("email: ${DataHolder.emailC.text}");
                    print("phone: ${DataHolder.callC.text}");
                    print("address: ${DataHolder.addressC.text}");
                    // clearTextControllers();
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        content: SizedBox(
                          height: 200,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Stack(
                                alignment: Alignment.center,
                                children: [
                                  Container(
                                    height: 80,
                                    width: 80,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(40),
                                        color: secondaryColor),
                                  ),
                                  Icon(
                                    Icons.check_circle_rounded,
                                    color: primaryColor,
                                    size: 60,
                                  ),
                                ],
                              ),
                              SizedBox(height: 10),
                              Text("Profil berhasil di update"),
                            ],
                          ),
                        ),
                        actions: [
                          ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                              Navigator.of(context).pop();
                            },
                            child: Text(
                              "OK",
                              style: TextStyle(color: secondaryColor),
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: primaryColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                          )
                        ],
                      ),
                    );
                  },
                  child: Text(
                    'Simpan',
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
