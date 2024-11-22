import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  File? _avatarImage;

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _avatarImage = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ЗГ'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // Аватар пользователя с возможностью изменения
              Stack(
                alignment: Alignment.bottomRight,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    width: 150,
                    height: 150,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: _avatarImage != null
                          ? Image.file(
                        _avatarImage!,
                        fit: BoxFit.cover,
                      )
                          : Center(
                        child: Text(
                          'П',
                          style: TextStyle(
                            fontSize: 80,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: _pickImage,
                    icon: Icon(
                      Icons.camera_alt,
                      color: Colors.white,
                      size: 30,
                    ),
                    color: Colors.grey[700],
                  ),
                ],
              ),
              SizedBox(height: 16),
              // Информация пользователя
              _buildUserInfo('Имя', 'Пользователь П'),
              _buildUserInfo('ID пользователя', '@PolzovP'),
              _buildUserInfo('Номер телефона', '+79212492261'),
              SizedBox(height: 16),
              // Раздел "Публикации"
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Публикации',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
              SizedBox(height: 8),
              GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount: 4, // Количество публикаций
                itemBuilder: (context, index) {
                  return Container(
                    color: Colors.blueGrey[800],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildUserInfo(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
        ),
        Text(
          value,
          style: TextStyle(fontSize: 16),
        ),
        SizedBox(height: 8),
      ],
    );
  }
}
