import 'dart:io';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:project_app/data_holder.dart';
import 'package:project_app/resources/color.dart';

class transferPay extends StatefulWidget {
  @override
  _transferPayState createState() => _transferPayState();
}

class _transferPayState extends State<transferPay> {
  File? _pickedFile;
  File? _savedFile;

  Future<void> _pickFile() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles();
      if (result != null) {
        setState(() {
          _pickedFile = File(result.files.single.path!);
          _savedFile = _pickedFile;
          // Simpan ke DataHolder
        });
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
        backgroundColor: primaryColor,
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          'Upload Bukti Pembayaran',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: ListView(
            shrinkWrap: true,
            children: <Widget>[
              Text('Petunjuk pembayaran'),
              Text(
                  '1. Silahkan lakukan pembayaran dengan cara memilih transfer uang ke \n    rekening berikut sejumlah total harga yang tertera sebelumnya'),
              SizedBox(height: 10),
              Card(
                child: SizedBox(
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('BRI : 66xxxxxxxxxx'),
                        Text('BNI : 66xxxxxxxxxx'),
                        Text('BCA : 66xxxxxxxxxx'),
                        Text('Mandiri : 66xxxxxxxxxx'),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Text(
                  '2. Kemudian screenshoot dan upload bukti pembayaran di sini'),
              Text(
                  '3. Selanjutnya pembayaran akan diproses oleh admin, dan \n    produk akan segera disiapkan'),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _pickFile,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                      child: Text(
                        'Upload bukti pembayaran ',
                        style: TextStyle(
                          color: secondaryColor,
                        ),
                      ),
                    ),
                    Icon(
                      Icons.upload_file,
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
                  : Text('Belum ada file yang dipilih'),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_savedFile != null) {
                    DataHolder.savedFile = _savedFile;
                  } else {
                    print(
                        'Tidak ada file yang dipilih'); // Tangani kasus di mana tidak ada file yang dipilih
                  }
                  Navigator.of(context).pop();
                },
                child: Flexible(
                  child: Text(
                    'Lanjut',
                    style: TextStyle(
                      color: secondaryColor,
                    ),
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
