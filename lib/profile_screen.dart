import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
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
            Center(
              child: CircleAvatar(
                radius: 50,
                backgroundColor: Colors.green,
                child: Text(
                  'П',
                  style: TextStyle(fontSize: 40, color: Colors.white),
                ),
              ),
            ),
            SizedBox(height: 16),
            Text('Имя', style: TextStyle(fontWeight: FontWeight.bold)),
            Text('Пользователь П'),
            SizedBox(height: 8),
            Text('id пользователя', style: TextStyle(fontWeight: FontWeight.bold)),
            Text('@PolzovP'),
            SizedBox(height: 8),
            Text('Номер телефона', style: TextStyle(fontWeight: FontWeight.bold)),
            Text('+79212492261'),
            SizedBox(height: 16),
            Text('Публикации', style: TextStyle(fontWeight: FontWeight.bold)),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount: 4, // Замените на количество публикаций
                itemBuilder: (context, index) {
                  return Container(
                    color: Colors.blueGrey[800],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
