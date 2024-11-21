import 'package:flutter/material.dart';
import 'dart:math';
import 'profile_screen.dart';  // Убедитесь, что у вас есть экран профиля
import 'settings_screen.dart'; // Убедитесь, что у вас есть экран настроек

class HomeScreen extends StatelessWidget {
  final List<String> dummyPosts = [
    "Сегодня прекрасный день для новых идей!",
    "Кто-нибудь знает, как улучшить продуктивность?",
    "Делюсь своими мыслями по поводу Flutter...",
    "Жизнь — это искусство, а мы художники!",
    "Просто тестовый пост для проверки интерфейса.",
  ];

  final Random random = Random();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'ЗГ',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.blue, Colors.green], // Градиент
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30),
            ),
          ),
        ),
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blueGrey,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.green,
                    child: Text(
                      'П',
                      style: TextStyle(fontSize: 40, color: Colors.white),
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Пользователь П',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  Text(
                    '+79212492261',
                    style: TextStyle(color: Colors.white70, fontSize: 14),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Мой профиль'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProfileScreen()), // Переход на экран профиля
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Настройки'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SettingsScreen()), // Переход на экран настроек
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text('Выход'),
              onTap: () {
                // Логика выхода
              },
            ),
          ],
        ),
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(8),
        itemCount: 5,
        itemBuilder: (context, index) {
          return Card(
            color: Colors.grey[800],
            margin: EdgeInsets.only(bottom: 12),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Заголовок пользователя
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundColor:
                        Colors.primaries[index % Colors.primaries.length],
                        child: Text(
                          'П${index + 1}',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      SizedBox(width: 8),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Пользователь ${index + 1}',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            '@Polzov${index + 1}',
                            style: TextStyle(
                              color: Colors.white54,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  // Текст поста
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.grey[700],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      dummyPosts[random.nextInt(dummyPosts.length)],
                      style: TextStyle(color: Colors.white, fontSize: 14),
                    ),
                  ),
                  SizedBox(height: 8),
                  // Дата и просмотры
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '13.11.2024 в ${random.nextInt(24).toString().padLeft(2, '0')}:${random.nextInt(60).toString().padLeft(2, '0')}',
                        style: TextStyle(color: Colors.white54, fontSize: 12),
                      ),
                      Row(
                        children: [
                          Icon(Icons.visibility,
                              size: 18, color: Colors.white54),
                          SizedBox(width: 4),
                          Text(
                            '${10 + random.nextInt(50)}',
                            style: TextStyle(color: Colors.white54, fontSize: 12),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showAddPostDialog(context);
        },
        child: Icon(Icons.add),
      ),
    );
  }

  void _showAddPostDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        TextEditingController postController = TextEditingController();
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          backgroundColor: Colors.black.withOpacity(0.8),
          child: Container(
            width: MediaQuery.of(context).size.width * 0.85,
            padding: EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Создать новую публикацию',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[900],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  child: TextField(
                    controller: postController,
                    maxLines: 3,
                    decoration: InputDecoration(
                      hintText: 'Введите текст публикации',
                      hintStyle: TextStyle(color: Colors.white54),
                      border: InputBorder.none,
                    ),
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    // Логика публикации
                    if (postController.text.isNotEmpty) {
                      print('Добавлен пост: ${postController.text}');
                    }
                    Navigator.pop(context); // Закрытие диалога
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text('Опубликовать'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
