import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Изменить имя', style: TextStyle(fontWeight: FontWeight.bold)),
            Text('Пользователь П'),
            SizedBox(height: 8),
            Text('Изменить id пользователя', style: TextStyle(fontWeight: FontWeight.bold)),
            Text('@PolzovP'),
            SizedBox(height: 8),
            Text('Изменить номер телефона', style: TextStyle(fontWeight: FontWeight.bold)),
            Text('+79212492261'),
            SizedBox(height: 16),
            TextButton(
              onPressed: () {
                // Логика удаления аккаунта
              },
              child: Text(
                'Удалить аккаунт',
                style: TextStyle(color: Colors.red),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
