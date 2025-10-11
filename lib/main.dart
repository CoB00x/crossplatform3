import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Практическая работа 3',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ContentSwitcherScreen(),
    );
  }
}

class ContentSwitcherScreen extends StatefulWidget {
  @override
  _ContentSwitcherScreenState createState() => _ContentSwitcherScreenState();
}

class _ContentSwitcherScreenState extends State<ContentSwitcherScreen> {
  int _currentContentIndex = 0;

  final List<Map<String, dynamic>> _contentList = [
    {
      'title': 'Заголовок 1',
      'description': 'Страница 1',
      'color': Colors.blue[100]!,
    },
    {
      'title': 'Заголовок 2',
      'description': 'Страница 2',
      'color': Colors.green[100]!,
    },
    {
      'title': 'Заголовок 3',
      'description': 'Страница 3',
      'color': Colors.orange[100]!,
    },
    {
      'title': 'Заголовок 4',
      'description': 'Страница 4',
      'color': Colors.purple[100]!,
    },
  ];

  void _nextContent() {
    setState(() {
      _currentContentIndex = (_currentContentIndex + 1) % _contentList.length;
    });
  }

  void _previousContent() {
    setState(() {
      _currentContentIndex = (_currentContentIndex - 1) % _contentList.length;
      if (_currentContentIndex < 0) {
        _currentContentIndex = _contentList.length - 1;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentContent = _contentList[_currentContentIndex];

    return Scaffold(
      appBar: AppBar(
        title: Text('Практическая работа 3'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                color: currentContent['color'],
                borderRadius: BorderRadius.circular(12.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Text(
                    currentContent['title'],
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue[800],
                    ),
                  ),
                  SizedBox(height: 16.0),
                  Text(
                    currentContent['description'],
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.grey[800],
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 20.0),
                  Text(
                    'Страница ${_currentContentIndex + 1} из ${_contentList.length}',
                    style: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.w500,
                      color: Colors.blue[700],
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 40.0),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: _previousContent,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                    padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.arrow_back),
                      SizedBox(width: 8.0),
                      Text('Назад'),
                    ],
                  ),
                ),

                ElevatedButton(
                  onPressed: _nextContent,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    foregroundColor: Colors.white,
                    padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('Вперед'),
                      SizedBox(width: 8.0),
                      Icon(Icons.arrow_forward),
                    ],
                  ),
                ),
              ],
            ),

            SizedBox(height: 20.0),
            Container(
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Column(
                children: [
                  Text(
                    'Быстрый переход:',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                    ),
                  ),
                  SizedBox(height: 12.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: List.generate(
                      _contentList.length,
                          (index) => ElevatedButton(
                        onPressed: () {
                          setState(() {
                            _currentContentIndex = index;
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: _currentContentIndex == index
                              ? Colors.blue
                              : Colors.grey,
                          foregroundColor: Colors.white,
                        ),
                        child: Text('${index + 1}'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}