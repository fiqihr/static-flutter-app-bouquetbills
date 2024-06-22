import 'dart:io';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:project_app/data_holder.dart';
import 'package:project_app/resources/color.dart';
import 'package:permission_handler/permission_handler.dart';

class updatePhotoProfile extends StatefulWidget {
  @override
  _updatePhotoProfileState createState() => _updatePhotoProfileState();
}

class _updatePhotoProfileState extends State<updatePhotoProfile> {
  File? _pickedFile;
  File? _savedPhotoProfile;

  Future<void> _pickFile() async {
    try {
      var status = await Permission.storage.request();
      if (status == PermissionStatus.granted) {
        FilePickerResult? result = await FilePicker.platform.pickFiles();
        if (result != null) {
          setState(() {
            _pickedFile = File(result.files.single.path!);
            _savedPhotoProfile = _pickedFile;
          });
        }
      } else {
        print('Izin akses penyimpanan ditolak');
      }
    } catch (e) {
      print('Error picking file: $e');
    }
  }

  bool upload = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: primaryColor,
        title: Text(
          'Update Foto Profile',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: ListView(
            shrinkWrap: true,
            children: <Widget>[
              SizedBox(height: 20),
              SizedBox(height: 20.0),
              _pickedFile != null
                  ? Container(
                      child: Padding(
                        padding: const EdgeInsets.only(
                          left: 150,
                          right: 150,
                          top: 10,
                          bottom: 10,
                        ),
                        child: Image.file(
                          _pickedFile!,
                          fit: BoxFit.cover,
                        ),
                      ),
                    )
                  : Center(
                      child: Text('Belum ada file yang dipilih'),
                    ),
              ElevatedButton(
                onPressed: _pickFile,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                      child: Text(
                        'Upload foto profile ',
                        style: TextStyle(color: secondaryColor),
                      ),
                    ),
                    Icon(
                      Icons.photo,
                      color: secondaryColor,
                    ),
                  ],
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryColor,
                  elevation: 5,
                  shadowColor: Colors.grey,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_savedPhotoProfile != null) {
                    DataHolder.savedPhotoProfile = _savedPhotoProfile;
                  } else {
                    print(
                        'Tidak ada file yang dipilih'); // Tangani kasus di mana
                  }
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
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
                          Text('Foto profil berhasil di update')
                        ],
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
                child: Flexible(
                  child: Text(
                    'Simpan',
                    style: TextStyle(color: secondaryColor),
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryColor,
                  elevation: 5,
                  shadowColor: Colors.grey,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
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
