import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController idController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Установим начальные значения
    nameController.text = 'Пользователь П';
    idController.text = '@PolzovP';
    phoneController.text = '+79212492261';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Настройки'),
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
            // Изменение имени
            Text('Имя пользователя', style: TextStyle(fontWeight: FontWeight.bold)),
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                hintText: 'Введите новое имя',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),

            // Изменение ID пользователя
            Text('ID пользователя', style: TextStyle(fontWeight: FontWeight.bold)),
            TextField(
              controller: idController,
              decoration: InputDecoration(
                hintText: 'Введите новый ID',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),

            // Изменение номера телефона
            Text('Номер телефона', style: TextStyle(fontWeight: FontWeight.bold)),
            TextField(
              controller: phoneController,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                hintText: 'Введите новый номер телефона',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),

            // Кнопка сохранения изменений
            ElevatedButton(
              onPressed: () {
                // Логика сохранения данных
                String newName = nameController.text;
                String newId = idController.text;
                String newPhone = phoneController.text;

                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text('Изменения сохранены'),
                      content: Text(
                          'Имя: $newName\nID: $newId\nТелефон: $newPhone'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text('OK'),
                        ),
                      ],
                    );
                  },
                );
              },
              child: Text('Сохранить изменения'),
            ),
            SizedBox(height: 16),

            // Кнопка удаления аккаунта
            TextButton(
              onPressed: () {
                // Логика удаления аккаунта
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text('Подтверждение'),
                      content: Text('Вы уверены, что хотите удалить аккаунт?'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context); // Закрыть диалог
                          },
                          child: Text('Отмена'),
                        ),
                        TextButton(
                          onPressed: () {
                            // Реализовать логику удаления аккаунта
                            Navigator.pop(context); // Закрыть диалог
                            Navigator.pop(context); // Вернуться на предыдущий экран
                          },
                          child: Text(
                            'Удалить',
                            style: TextStyle(color: Colors.red),
                          ),
                        ),
                      ],
                    );
                  },
                );
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
